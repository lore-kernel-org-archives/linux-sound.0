Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2823233134
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 22:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779144422; cv=none; b=cGbWei8K5lYtV2cNjrPHL6jaisORPMOFGN/J+TvVUB6XIb0F48CH6XrCffqc7w019hyoOQ1iaP7on60k17zxnPmDqkTo4qAbhtalF8Ce2CsOq8sfB72Js14g+L0qDpL3QDayoM1/vi166AG9ZMAnbZ14GgC34SW6twBRvxvYfGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779144422; c=relaxed/simple;
	bh=G9BU5KL/YplAj6Yo9TS1pdkQkrjZy6jaQwxPxiDppus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1rKR9vNYyUJwC38KY1tYNyN1LztDHlNuVeV93bOMmBfb7ZAhDhEGE5OYicLutC1r5Wpl1TX6nVPXT1OdNanIUfgHeXfH7unPOk4cwe+G2FPBojmEMtmPEzlYENhcCo2obAgr/GwpwO0c/pfoGxEN07tsOsZFj++E1fnN7ArvOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KD36CJo9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KD36CJo9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4196FC2BCB7;
	Mon, 18 May 2026 22:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779144422;
	bh=G9BU5KL/YplAj6Yo9TS1pdkQkrjZy6jaQwxPxiDppus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KD36CJo9Lgs1N00HA94+uxktVjyYCzPN6ksBFHJ/hhJfWi+ca/HOTNGbA5q2gJvq4
	 TCP9DK/+i6NYWSfjKYjOqtJrtQm1efWgkhiCCpsB1GDdOoSiEaVWtulzswWIX12D9K
	 vaQ4qIVbtDXrr8uUVKzA/VKfHjCfVoETJOp+j093WRzttMze8KF+pJkJ4oyvLC/gIx
	 J+tIJiis7g7MjPGxWak0SUMAgPjHzcLtUFyvEo6gye67imHt4wTpWVL4l1+tyZ+X75
	 +7crBOCe9dtJFRDozirKWWtjVFEk1TWs6iUDg1Qg4Od0gCParUkvckOsZata83m7ZO
	 isM+CsRynUH5w==
Date: Mon, 18 May 2026 15:46:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: broonie@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com, vkoul@kernel.org
Subject: Re: [PATCH v15 3/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <20260518224657.GA536765@ax162>
References: <20260514075206.3483-1-zhangyi@everest-semi.com>
 <20260514075206.3483-4-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514075206.3483-4-zhangyi@everest-semi.com>

Hi,

On Thu, May 14, 2026 at 03:52:03PM +0800, Zhang Yi wrote:
> This is the codec driver for es9356-sdca.
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
...
> diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
> new file mode 100644
> index 000000000..78fddd9d0
> --- /dev/null
> +++ b/sound/soc/codecs/es9356.c
...
> +static const struct snd_kcontrol_new es9356_sdca_controls[] = {
> +	SDCA_SINGLE_Q78_TLV("FU41 Left Playback Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_L),
> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
> +	SDCA_SINGLE_Q78_TLV("FU41 Right Playback Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_R),
> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
> +	SDCA_SINGLE_Q78_TLV("FU36 Left Capture Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_L),
> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
> +	SDCA_SINGLE_Q78_TLV("FU36 Right Capture Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_R),
> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
> +	SDCA_SINGLE_Q78_TLV("FU33 Capture Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU33, ES9356_SDCA_CTL_FU_CH_GAIN, 0),
> +		ES9356_GAIN_MIN, ES9356_AMIC_GAIN_MAX, ES9356_AMIC_GAIN_STEP, amic_gain_tlv),
> +	SDCA_SINGLE_Q78_TLV("FU21 Left Playback Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_L),
> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
> +	SDCA_SINGLE_Q78_TLV("FU21 Right Playback Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_R),
> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
> +	SDCA_SINGLE_Q78_TLV("FU113 Left Capture Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_L),
> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
> +	SDCA_SINGLE_Q78_TLV("FU113 Right Capture Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_R),
> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
> +	SDCA_SINGLE_Q78_TLV("FU11 Capture Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU11, ES9356_SDCA_CTL_FU_CH_GAIN, 0),
> +		ES9356_GAIN_MIN, ES9356_DMIC_GAIN_MAX, ES9356_DMIC_GAIN_STEP, dmic_gain_tlv),
> +};

The use of SDCA_SINGLE_Q78_TLV() can break the build for architectures
that do not support ACPI, as CONFIG_SND_SOC_SDCA depends on ACPI and
the driver does not actually select it, so it might not be enabled if
another driver that does select it is not enabled:

  $ printf "CONFIG_%s=m\n" SOUNDWIRE SND_SOC_ES9356 >arch/arm/configs/repro.config

  $ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- mrproper defconfig repro.config all
  ERROR: modpost: "sdca_asoc_q78_get_volsw" [sound/soc/codecs/snd-soc-es9356.ko] undefined!
  ERROR: modpost: "sdca_asoc_q78_put_volsw" [sound/soc/codecs/snd-soc-es9356.ko] undefined!
  ...

Maybe something like this is needed?

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5fdd0334c355..b9e8df5ddfd5 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1302,7 +1302,9 @@ config SND_SOC_ES8389
 
 config SND_SOC_ES9356
         tristate "Everest Semi ES9356 CODEC SDW"
+	depends on ACPI
         depends on SOUNDWIRE
+	select SND_SOC_SDCA
         select REGMAP_SOUNDWIRE
         select REGMAP_SOUNDWIRE_MBQ
 
-- 
Cheers,
Nathan
