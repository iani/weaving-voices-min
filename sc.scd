/*
Server.default.serverRunning;

OSCFunc.trace(true);

OSCFunc.trace(false);

Server.default.quit;

Server.default.boot;

*/





Server.default.waitForBoot({
	{
		var paths, buffers;

		paths = "/home/pi/dev/weavingvoices/weaving-voices-samples/*.wav".pathMatch;

		buffers = paths collect: { | path | Buffer.read(Server.default, path) };

		10.wait;
		
		((0..11) collect: { | num |
			format("a%", num)
		}) do: { | message |
			OSCFunc({
				// message.postln;
				(degree: 0).play;
				buffers.choose.play;
				
			}, message.asSymbol).add;
		};
		((0..11) collect: { | num |
			format("b%", num)
		}) do: { | message |
			OSCFunc({
				// message.postln;
				(degree: 10).play;

				buffers.choose.play;
				
			}, message.asSymbol).add;
		};
	}.fork;
});

/*

{ SinOsc.ar(3000, 0, 0.5) }.play;

*/