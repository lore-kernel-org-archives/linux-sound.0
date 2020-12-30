From: Michael <michael@fossekall.de>
Date: Wed, 30 Dec 2020 22:58:13 +0000
Subject: ASoC: No stereo on Banana Pi M2 headphone jack
Message-Id: <20201230225813.GA6402@a98shuttle.de>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi all,

I'm in need for stereo sound on the headphone jack of a Banana Pi M2 
(Allwinner A31s), but I'm getting only mono differential (I assume at 
least, because I can hear both channels in either speaker).

In alsamixer, there is a switch to select between stereo and mono 
diffential output for the LINE output (that has no notable effect), but 
not for the Headphone output.

Driver limitation/bug? Hardware deficiency? Configuration error? Any 
other idea?

FWIW, this is the DT overlay to get any sound at all:

/dts-v1/;
/plugin/;

/ {
	fragment@0 {
		target = <&codec>;
		__overlay__ {
			status = "okay";
			allwinner,audio-routing = "Headphone", "HP";
		};
	};
};


Regards,
Michael
