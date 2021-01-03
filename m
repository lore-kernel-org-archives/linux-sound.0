From: Michael <michael@fossekall.de>
Date: Sun, 03 Jan 2021 22:58:51 +0000
Subject: Re: ASoC: No stereo on Banana Pi M2 headphone jack
Message-Id: <20210103225851.GA27558@a98shuttle.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20201230225813.GA6402@a98shuttle.de>
In-Reply-To: <20201230225813.GA6402@a98shuttle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, Dec 30, 2020 at 11:58:14PM +0100, Michael wrote:
>Hi all,
>
>I'm in need for stereo sound on the headphone jack of a Banana Pi M2 
>(Allwinner A31s), but I'm getting only mono differential (I assume at 
>least, because I can hear both channels in either speaker).
>
>In alsamixer, there is a switch to select between stereo and mono 
>diffential output for the LINE output (that has no notable effect), 
>but not for the Headphone output.

Never mind; This happens if you plug a CTIA headset into a OMTP jack.

Michael
