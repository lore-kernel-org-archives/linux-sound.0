Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D5F1B966
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708945756; cv=none; b=MwEXS5KLJgahWUm8oPnXLtCMm0LPvBGRl8si8le/o7LHF9FlMnjqufJJOFvM7b0zxXln91yljtBAQBnfOzs3bgMKlQFmitZsUeOlWtiA9AoKqgZx6jpPEwdALj0ZPt0P43phLMd8Lr4WSZMT7QmLyBXpSKQHQkYvQ00LsZ+pTe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708945756; c=relaxed/simple;
	bh=JFrZhl2s3V6bOgunbNihfw2Wulvq2LTqnSZ68Jgu+qI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b/QK6gKLHnb134/j7gSatpXPN1TxhHSZkgNIEpFBHoWXwgfriAaQBrCCSzddQe6MinJwGEwzb3MFwB2RaBmPIgevyCIZKjKiu1CRjI4azrXQKL9WH0PAwlV2A2jDWs7rSi4Ws1jQJ70dJBMrbOtOYxG15JyDgkvMBEXMe0WJcX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HGsddNa7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jJPg1PXR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HGsddNa7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jJPg1PXR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HGsddNa7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jJPg1PXR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HGsddNa7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jJPg1PXR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2CB611FB44;
	Mon, 26 Feb 2024 11:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708945753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=te11WaeX7OAf02qoJP3VKHEWOzFi52BKV+snlTsoDhA=;
	b=HGsddNa7xLzNxUZOW7rRXy7XngEoi0MgpG/zXSjVI1CYPZeeg3lPQGAyzHFIv4lB8ye4p4
	cOA9twm2j7ooWbb0d5DuAuWc6y9Wv2R0p/T+/0uxPmrLfyaBud+XI5WI8w2LaBVGihoy66
	Lbx1NCgkOqW++DXkdTsjSx06zOhETsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708945753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=te11WaeX7OAf02qoJP3VKHEWOzFi52BKV+snlTsoDhA=;
	b=jJPg1PXRU9rVvPYtxO9HROlq1Rso1Pka0pQQ4BZpApvcc31wa8/QlhQjZjJtegBRVQEuIK
	HKrSd1sfZeBGhPDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708945753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=te11WaeX7OAf02qoJP3VKHEWOzFi52BKV+snlTsoDhA=;
	b=HGsddNa7xLzNxUZOW7rRXy7XngEoi0MgpG/zXSjVI1CYPZeeg3lPQGAyzHFIv4lB8ye4p4
	cOA9twm2j7ooWbb0d5DuAuWc6y9Wv2R0p/T+/0uxPmrLfyaBud+XI5WI8w2LaBVGihoy66
	Lbx1NCgkOqW++DXkdTsjSx06zOhETsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708945753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=te11WaeX7OAf02qoJP3VKHEWOzFi52BKV+snlTsoDhA=;
	b=jJPg1PXRU9rVvPYtxO9HROlq1Rso1Pka0pQQ4BZpApvcc31wa8/QlhQjZjJtegBRVQEuIK
	HKrSd1sfZeBGhPDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1D3213A58;
	Mon, 26 Feb 2024 11:09:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ebAALlhx3GVYOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Feb 2024 11:09:12 +0000
Date: Mon, 26 Feb 2024 12:09:12 +0100
Message-ID: <87o7c3zdlz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <broonie@kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<tiwai@suse.com>,
	<perex@perex.cz>,
	<jani.nikula@linux.intel.com>,
	<joonas.lahtinen@linux.intel.com>,
	<rodrigo.vivi@intel.com>,
	<tvrtko.ursulin@linux.intel.com>,
	<intel-gfx@lists.freedesktop.org>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/4] ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
In-Reply-To: <19f57fc4-ae64-4054-a85c-38ff37c1bded@intel.com>
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
	<20240223114626.1052784-3-cezary.rojewski@intel.com>
	<87plwn2qbs.wl-tiwai@suse.de>
	<19f57fc4-ae64-4054-a85c-38ff37c1bded@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.10

On Fri, 23 Feb 2024 18:09:59 +0100,
Cezary Rojewski wrote:
> 
> On 2024-02-23 3:44 PM, Takashi Iwai wrote:
> > On Fri, 23 Feb 2024 12:46:24 +0100,
> > Cezary Rojewski wrote:
> >> 
> >> If i915 does not support given platform but the hardware i.e.: HDAudio
> >> codec is still there, the codec-probing procedure will succeed for such
> >> device but the follow up initialization will always end up with -ENODEV.
> >> 
> >> While bus could filter out address '2' which Intel's HDMI/DP codecs
> >> always enumerate on, more robust approach is to check for i915 presence
> >> before registering display codecs.
> >> 
> >> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> >> ---
> >>   sound/soc/codecs/hda.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >> 
> >> diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
> >> index d2117e36ddd1..d9e7cd8aada2 100644
> >> --- a/sound/soc/codecs/hda.c
> >> +++ b/sound/soc/codecs/hda.c
> >> @@ -350,6 +350,11 @@ static int hda_hdev_attach(struct hdac_device *hdev)
> >>   	struct hda_codec *codec = dev_to_hda_codec(&hdev->dev);
> >>   	struct snd_soc_component_driver *comp_drv;
> >>   +	if (hda_codec_is_display(codec) &&
> >> !hdev->bus->audio_component) {
> >> +		dev_dbg(&hdev->dev, "no i915, skip registration for 0x%08x\n", hdev->vendor_id);
> >> +		return 0;
> > 
> > Should we return success here, or would it better with -ENODEV?
> > IIUC, the code path is from the early hda_codec_driver_probe() hook,
> > so returning an error can work.
> 
> Good suggestion. Indeed attach() is called by probe() which treats
> -ENODEV just fine.
> 
> There is a consequence to that though. Logs from LKF show:
> 
> snd_soc_hda_codec:hda_hdev_attach: snd_hda_codec_hdmi hdaudioB0D2: no
> i915, skip registration for 0x80862811
> snd_soc_hda_codec:hda_hdev_attach: snd_hda_codec_generic hdaudioB0D2:
> no i915, skip registration for 0x80862811
> snd_soc_hda_codec:hda_hdev_attach: snd_hda_codec_generic hdaudioB0D2:
> no i915, skip registration for 0x80862811
> snd_hda_codec:snd_hda_codec_configure: hdaudio hdaudioB0D2: Unable to
> bind the codec
> snd_soc_avs 0000:00:1f.3: failed to config codec -19
> snd_soc_avs 0000:00:1f.3: Codec #2 probe error; disabling it...

Yeah the latter two are basically fallbacks, and I guess we can
disable them for ASoC case?  An additional patch like below.


thanks,

Takashi

--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -279,6 +279,10 @@ static int codec_bind_generic(struct hda_codec *codec)
 	if (codec->probe_id)
 		return -ENODEV;
 
+	/* no generic fallback for ASoC binding */
+	if (codec->bus->core.ext_ops)
+		return -ENODEV;
+
 	if (is_likely_hdmi_codec(codec)) {
 		codec->probe_id = HDA_CODEC_ID_GENERIC_HDMI;
 		request_codec_module(codec);
