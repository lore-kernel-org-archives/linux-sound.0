Received: from mail.mixaill.net (mail.mixaill.net [144.76.234.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710B2746C
	for <linux-sound@vger.kernel.org>; Sun, 17 Aug 2025 11:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.234.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755428689; cv=none; b=ecK360XW1ZcOgEmfZUnrTGDOw1wWbB37ZadJpzS/N4ZGnrxPdduq7gXDFXeAjutLEsF4hn8Mg3fCPbVdZLajqOeVTttm95CC9MM/+Ex2q9EzlnLhPNJ5epTKDtQb+Faz4aPDk9vvuDO0LwyLzRTsxIn1YQNYyp4A3Myc54xtfas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755428689; c=relaxed/simple;
	bh=Yz1/beXr+po492UBQylnmsT35L1Yp9TDhWKSaUoMeF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqzyQG2zhK/gm77ViQQ8rlSiPl+OEZW614oG9+8SW9JNMvU9q0ldDVNH0/pJwsnTGO+K/e5nIZRC6C9Evxhe+CKN0EGkh/2sQ8/t67IaDjjnrDNGKLXSNVZaG1ASZhMthjOmuw6zc5rqCSHoF16OY00SmSkIgP37fszJ5UIzpxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net; spf=pass smtp.mailfrom=mixaill.net; dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b=TN/Kgx1c; arc=none smtp.client-ip=144.76.234.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mixaill.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b="TN/Kgx1c"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 559A03D147;
	Sun, 17 Aug 2025 10:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mixaill.net; s=dkim;
	t=1755428155; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=UTgo+R1XHTOfdtDFSU5P5jDUaYCsw03fNJDXXvVerRs=;
	b=TN/Kgx1clDqH7NGt6Xfzb7mjB06ptGzxhicyP39U6K6sQON+OwxiD+Ox2RirIDPX+0DXFW
	faqpat7buVtRF54VxhH8X0/M1JiLGMNzQ0abnjnLVCKF3dnW3+DVcl3skEKuaGmbVmC1Lg
	d9dJ70N90ieAymwKJPdtUnLKB24+HE4H7Ebm0E9PhtxgB1xT4uZMkBNUnjm/zk9V/7GctV
	T2pM4FVjBUanrb8Hf++v7Qk2DIY66zYspt9Ta4oJVNmOaQZW1jeAdr0IIGF16p/2VBX+1u
	OrVGJ2VyevhrVGTCtvR/U53m9HpMp0szuNThNl94rL4YQNlCGQRc/P91DHNDbA==
Message-ID: <14a14afe-eea9-4888-95e1-9b82c1e855e8@mixaill.net>
Date: Sun, 17 Aug 2025 13:55:48 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/27] ALSA: hda/hdmi: Rewrite to new probe method
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Kailang <kailang@realtek.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, patches@opensource.cirrus.com,
 Baojun Xu <baojun.xu@ti.com>, bo liu <bo.liu@senarytech.com>
References: <20250709160434.1859-1-tiwai@suse.de>
 <20250709160434.1859-24-tiwai@suse.de>
Content-Language: en-US
From: Mikhail Paulyshka <me@mixaill.net>
In-Reply-To: <20250709160434.1859-24-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/9/25 7:04 PM, Takashi Iwai wrote:
> diff --git a/sound/hda/codecs/hdmi/intelhdmi.c b/sound/hda/codecs/hdmi/intelhdmi.c
> index a88ac1f80db6..23237d527430 100644
> --- a/sound/hda/codecs/hdmi/intelhdmi.c
> +++ b/sound/hda/codecs/hdmi/intelhdmi.c
> @@ -701,51 +698,104 @@ static int patch_i915_byt_hdmi(struct hda_codec *codec)
>   }
>   
>   /* Intel IronLake, SandyBIridge and IvyBridge; with eld notifier */
> -static int patch_i915_cpt_hdmi(struct hda_codec *codec)
> +static int probe_i915_cpt_hdmi(struct hda_codec *codec)
> +{
> +	return parse_intel_hdmi(codec);
> +}
> +
> +/*
> + * common driver probe
> + */
> +static int intelhdmi_probe(struct hda_codec *codec, const struct hda_device_id *id)
>   {
>   	int err;
>   
>   	err = alloc_intel_hdmi(codec);
>   	if (err < 0)
>   		return err;
> -	return parse_intel_hdmi(codec);
> +
> +	switch (id->driver_data) {
> +	case MODEL_HSW:
> +		err = probe_i915_hsw_hdmi(codec);
> +		break;
> +	case MODEL_GLK:
> +		err = probe_i915_glk_hdmi(codec);
> +		break;
> +	case MODEL_ICL:
> +		err = probe_i915_icl_hdmi(codec);
> +		break;
> +	case MODEL_TGL:
> +		err = probe_i915_tgl_hdmi(codec);
> +		break;
> +	case MODEL_ADLP:
> +		err = probe_i915_adlp_hdmi(codec);
> +		break;
> +	case MODEL_BYT:
> +		err = probe_i915_byt_hdmi(codec);
> +		break;
> +	case MODEL_CPT:
> +		err = probe_i915_cpt_hdmi(codec);
> +		break;
> +	default:
> +		err = -EINVAL;
> +		break;
> +	}
> +
> +	if (err < 0) {
> +		snd_hda_hdmi_generic_spec_free(codec);

Is this the intended behavior? It modifies the codec state even when it 
does not match any Intel model. We have reports from users on 6.17-rc1 
with AMD BC-250 hardware experiencing HDMI audio detection issues. 
Adding a check for |EINVAL| resolves the problem.

 > - if (err < 0) { > + if (err < 0 && err != -EINVAL) {

