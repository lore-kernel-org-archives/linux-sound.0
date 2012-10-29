From: Bo Shen <voice.shen@atmel.com>
Date: Mon, 29 Oct 2012 06:15:55 +0000
Subject: Re: [PATCH 5/5] ASoC: sam9g20_wm8731: fix the issue for non-DT kernel
Message-Id: <508E1F1B.8040308@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1350901079-18307-1-git-send-email-voice.shen@atmel.com>
 <1350901079-18307-5-git-send-email-voice.shen@atmel.com>
 <20121027221420.GN4564@opensource.wolfsonmicro.com>
In-Reply-To: <20121027221420.GN4564@opensource.wolfsonmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, nicolas.ferre@atmel.com, linux-sound@vger.kernel.org, plagnioj@jcrosoft.com, jm.lin@atmel.com, linux-arm-kernel@lists.infradead.org

On 10/28/2012 6:14, Mark Brown wrote:
> On Mon, Oct 22, 2012 at 06:17:59PM +0800, Bo Shen wrote:
>> When register platform from DAIs, the platform device to PCM no longer
>> needed. So, fix it with this patch
>
> This should be squashed into the change which changes the registeration
> to ensure that we don't get both methods used simultaneously.

OK, I will fix this in next version.

BRs,
Bo Shen

