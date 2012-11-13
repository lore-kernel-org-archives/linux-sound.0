From: Bo Shen <voice.shen@atmel.com>
Date: Tue, 13 Nov 2012 09:52:29 +0000
Subject: Re: [PATCH v5 2/3] ASoC: atmel-ssc-dai: register dai and pcm directly
Message-Id: <50A2185D.9020301@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1352706028-750-1-git-send-email-voice.shen@atmel.com> <1352706028-750-3-git-send-email-voice.shen@atmel.com> <20121113083031.GP18224@opensource.wolfsonmicro.com> <50A20E82.9020704@atmel.com> <20121113092038.GU18224@opensource.wolfsonmicro.com> <50A214FC.90201@atmel.com> <20121113094145.GV18224@opensource.wolfsonmicro.com>
In-Reply-To: <20121113094145.GV18224@opensource.wolfsonmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: plagnioj@jcrosoft.com, nicolas.ferre@atmel.com, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org

On 11/13/2012 17:41, Mark Brown wrote:
> On Tue, Nov 13, 2012 at 05:38:04PM +0800, Bo Shen wrote:
>> On 11/13/2012 17:20, Mark Brown wrote:
>
>>> The machine driver should know which SSC it is using all by itself, it's
>>> specific to a particular machine.  This is how it's been doing it since
>>> it was written...
>
>> So, you mean, I should hard code this into machine driver, am I right?
>
> Yes, exactly.

Ok, I will hard code it.
Thanks.

Best Regards,
Bo Shen
