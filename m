From: Daniel Mack <daniel@zonque.org>
Date: Wed, 02 Jul 2014 13:47:01 +0000
Subject: Re: [alsa-devel] [PATCH v3] ASoC: tas2552: Support TI TAS2552 Amplifier
Message-Id: <53B40D55.6000602@zonque.org>
List-Id: <linux-sound.vger.kernel.org>
References: <1404307852-10456-1-git-send-email-dmurphy@ti.com>
In-Reply-To: <1404307852-10456-1-git-send-email-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Murphy <dmurphy@ti.com>, linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org, linux-kernel@vger.kernel.org

Hi Dan,

On 07/02/2014 03:30 PM, Dan Murphy wrote:
> +	if (np) {
> +		data->power_gpio = of_get_named_gpio(np, "enable-gpio", 0);
> +	} else if (pdata) {
> +		data->power_gpio = pdata->enable_gpio;
> +	} else {
> +		dev_err(dev, "Platform or dev tree data not set\n");
> +		return -ENODEV;
> +	}

New code for GPIO handling should use the new gpiod interface.
See include/linux/gpio/consumer.h, or the sta350 codec driver.

For that to work, you also need to rename the property to
'enable-gpios', even though there's only one.


Daniel

