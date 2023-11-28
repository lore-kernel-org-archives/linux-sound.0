Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJq+G1f+"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFAC31A5
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 09:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701194034; x=1732730034;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=X/vuCuKhjCfbCD+yDhFxIgQrez9Yi+j96FEy1rjFZSg=;
  b=XJq+G1f+ygaNGiRcDgR+86vaDNgUQtnVppC4YBXRMR7YzvKN7kGV2sxH
   qx8RK0SY2uXy2tYL+pSKtY3ArRhG0KfRn3Sbl3jsII0Qs98Kk13mTo6qI
   yt6w+cINwOCe6hY3OMXM9v4kV40z4O3reK2qGNMgJqnXlNzLmML7t9HuZ
   a2c6jI+f9xfy302SejSeHEDJvlgnDCugE/XFlr0PrJkgH9kIZ617eS5xf
   qGS8A79ECW7dhuGOPz1UnEZi+6zYjJUDHBjvCpQy2QCEdvWwaudH56q7f
   1nTwuLARq51T/e61vK493ZxvZjm3DRdqYtSTH/8id4xt5XuKg1GYl7sA+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424127069"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="424127069"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:53:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834715293"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="834715293"
Received: from skumarso-mobl33.amr.corp.intel.com (HELO [10.255.231.208]) ([10.255.231.208])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:53:53 -0800
Message-ID: <1ca6f822-355a-4eb0-8e3c-f9a408074144@linux.intel.com>
Date: Tue, 28 Nov 2023 08:58:54 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: hdac_hda: Conditionally register dais for HDMI
 and Analog
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org, tiwai@suse.de
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
References: <20231128123914.3986-1-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231128123914.3986-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/28/23 06:39, Peter Ujfalusi wrote:
> The current driver is registering the same dais for each hdev found in the
> system which results duplicated widgets to be registered and the kernel
> log contains similar prints:
> snd_hda_codec_realtek ehdaudio0D0: ASoC: sink widget AIF1TX overwritten
> snd_hda_codec_realtek ehdaudio0D0: ASoC: source widget AIF1RX overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi3 overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi2 overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi1 overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Codec Output Pin1 overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Codec Input Pin1 overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Analog Codec Playback overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Digital Codec Playback overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Alt Analog Codec Playback overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Analog Codec Capture overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Digital Codec Capture overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Alt Analog Codec Capture overwritten
> 
> To avoid such issue, split the dai array into HDMI and non HDMI array and
> register them conditionally:
> for HDMI hdev only register the dais needed for HDMI
> for non HDMI hdev do not  register the HDMI dais.
> 
> Depends-on: 3d1dc8b1030d ("ASoC: Intel: skl_hda_dsp_generic: Drop HDMI routes when HDMI is not available")
> Link: https://github.com/thesofproject/linux/issues/4509
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
> Hi,
> 
> Changes since v1:
> - Drop the patch for patch_hdmi to export a funtion to match the device
> - Use the struct hdac_hda_priv.need_display_power boolean as indication that the
>   device is a HDMI/DP audio codec

LGTM.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> Regards,
> Peter
> 
>  sound/soc/codecs/hdac_hda.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
> index 355f30779a34..b075689db2dc 100644
> --- a/sound/soc/codecs/hdac_hda.c
> +++ b/sound/soc/codecs/hdac_hda.c
> @@ -132,6 +132,9 @@ static struct snd_soc_dai_driver hdac_hda_dais[] = {
>  		.sig_bits = 24,
>  	},
>  },
> +};
> +
> +static struct snd_soc_dai_driver hdac_hda_hdmi_dais[] = {
>  {
>  	.id = HDAC_HDMI_0_DAI_ID,
>  	.name = "intel-hdmi-hifi1",
> @@ -607,8 +610,16 @@ static const struct snd_soc_component_driver hdac_hda_codec = {
>  	.endianness		= 1,
>  };
>  
> +static const struct snd_soc_component_driver hdac_hda_hdmi_codec = {
> +	.probe			= hdac_hda_codec_probe,
> +	.remove			= hdac_hda_codec_remove,
> +	.idle_bias_on		= false,
> +	.endianness		= 1,
> +};
> +
>  static int hdac_hda_dev_probe(struct hdac_device *hdev)
>  {
> +	struct hdac_hda_priv *hda_pvt = dev_get_drvdata(&hdev->dev);
>  	struct hdac_ext_link *hlink;
>  	int ret;
>  
> @@ -621,9 +632,15 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
>  	snd_hdac_ext_bus_link_get(hdev->bus, hlink);
>  
>  	/* ASoC specific initialization */
> -	ret = devm_snd_soc_register_component(&hdev->dev,
> -					 &hdac_hda_codec, hdac_hda_dais,
> -					 ARRAY_SIZE(hdac_hda_dais));
> +	if (hda_pvt->need_display_power)
> +		ret = devm_snd_soc_register_component(&hdev->dev,
> +						&hdac_hda_hdmi_codec, hdac_hda_hdmi_dais,
> +						ARRAY_SIZE(hdac_hda_hdmi_dais));
> +	else
> +		ret = devm_snd_soc_register_component(&hdev->dev,
> +						&hdac_hda_codec, hdac_hda_dais,
> +						ARRAY_SIZE(hdac_hda_dais));
> +
>  	if (ret < 0) {
>  		dev_err(&hdev->dev, "failed to register HDA codec %d\n", ret);
>  		return ret;
