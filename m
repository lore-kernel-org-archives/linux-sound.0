Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC4E1624DE
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750420837; cv=none; b=DBj11MUJ6lcOkIf7z07L1455Zw/SyXc99ebKDRMUpsstncqx6JPWa2fALzA8DPgB59cMwDsU061q5j9X5ZuycVyO7P7y50q3ai1wSE3XAR1t+S1oIwPSaFbCjGfLPU7kroPehNacE14UHSrTts/51PuTTLSyhVW6E5nKPPBTJN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750420837; c=relaxed/simple;
	bh=WD1ocKzLrtwl8MSDj4xKbLvty8ljT/4Gc/U1swAVu4Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LSJroKohseyJQOEEhVwf2Y7dvvakCAcw1sw1zGv+rroZmT91BIECbUZExaH4OUFvOgT5Tbf2A7Ubmyoaumx838nLswq3r8H+xFXXlfT/kqwiAFAxoQJV4UDgIam+ISzwl3PMYKwr3bdLA6LAMGHXiVdCGZZ7YYD2xA/FcDJsIzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tLvOHQYl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DOtivUjs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tLvOHQYl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DOtivUjs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tLvOHQYl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DOtivUjs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tLvOHQYl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DOtivUjs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AB0F01F38D;
	Fri, 20 Jun 2025 12:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750420833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vugQT9FFwDNH2t7QrM8tK1r2QvU61bb5rv043Mm+ito=;
	b=tLvOHQYl92LhuNfXNYm0w5ZM+TdvWs0bw7J4HTH+N+1wMEcFyEc8PetTDCwwakwt4j1sIr
	UdKXQ6gY8yX0VDTsPtCZ6d6HMtquq7qf2YBWj12LQUgjR1imOh9SkoaAyfraPGvQXdpzNH
	s+EhDIbcy2QbMxHMvmV2wE/p5dtNudg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750420833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vugQT9FFwDNH2t7QrM8tK1r2QvU61bb5rv043Mm+ito=;
	b=DOtivUjslS5wUymnbNGBEmXOQk8esWp23UNIcr1Pd8djprSKo963jTa0IzW2bvGvIgP9xR
	eFArgmyU5+cNEjDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tLvOHQYl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DOtivUjs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750420833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vugQT9FFwDNH2t7QrM8tK1r2QvU61bb5rv043Mm+ito=;
	b=tLvOHQYl92LhuNfXNYm0w5ZM+TdvWs0bw7J4HTH+N+1wMEcFyEc8PetTDCwwakwt4j1sIr
	UdKXQ6gY8yX0VDTsPtCZ6d6HMtquq7qf2YBWj12LQUgjR1imOh9SkoaAyfraPGvQXdpzNH
	s+EhDIbcy2QbMxHMvmV2wE/p5dtNudg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750420833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vugQT9FFwDNH2t7QrM8tK1r2QvU61bb5rv043Mm+ito=;
	b=DOtivUjslS5wUymnbNGBEmXOQk8esWp23UNIcr1Pd8djprSKo963jTa0IzW2bvGvIgP9xR
	eFArgmyU5+cNEjDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6433213736;
	Fri, 20 Jun 2025 12:00:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZM+1FmFNVWibIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 12:00:33 +0000
Date: Fri, 20 Jun 2025 14:00:33 +0200
Message-ID: <87ecvewrku.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: joakim.zhang@cixtech.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	chris.chiu@canonical.com,
	kailang@realtek.com,
	geans_chen@realsil.com.cn,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH V1 1/4] ALSA: hda: fix controller cannot suspend when codec using jackpoll
In-Reply-To: <20250619020844.2974160-2-joakim.zhang@cixtech.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-2-joakim.zhang@cixtech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AB0F01F38D
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 19 Jun 2025 04:08:41 +0200,
joakim.zhang@cixtech.com wrote:
> 
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> For current design, sync cancel jackpoll delayed work in
> hda_codec_runtime_suspend(), sync means it will cancel pending
> works, so jackpoll work would be called.
>   hda_jackpoll_work()-->
>       snd_hda_power_up_pm()-->
>           if (!atomic_inc_not_zero(&codec->in_pm))
> 		return snd_hdac_power_up(codec);-->
> 		    pm_runtime_get_sync()
> 
> The point where cancel_delayed_work_sync() called not in_pm,
> though it actually is. It will runtime resume codec device again,
> the power usage_count increase 1, but it should be 0 when codec
> is suspending, finally codec is in resume state, not suspended.
> 
> HDA controller as the parent of codec device, also cannot enter
> suspend, this patch change to sync cancel jackpoll delayed work when
> codec in_pm is set, so it will not resume codec again.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  sound/pci/hda/hda_codec.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
> index c018beeecd3d..12caa5b2e678 100644
> --- a/sound/pci/hda/hda_codec.c
> +++ b/sound/pci/hda/hda_codec.c
> @@ -2912,7 +2912,9 @@ static int hda_codec_runtime_suspend(struct device *dev)
>  	if (!codec->card)
>  		return 0;
>  
> +	snd_hdac_enter_pm(&codec->core);
>  	cancel_delayed_work_sync(&codec->jackpoll_work);
> +	snd_hdac_leave_pm(&codec->core);

That's too awkward...

I believe that, if the hda-codec doesn't set jackpoll_in_suspend flag,
we should simply disable the runtime PM.  Such a device is supposed to
be polling frequently (e.g. VIA codec) that conflicts with the runtime
PM.

For that, we can simply define the runtime_idle callback.

Another point is that hda_jackpoll_work() could simply use
snd_hda_power_up() and *_down() instead of snd_hda_power_up_pm() and
co.  We used *_pm variant because the function was called directly in
the init or the resume paths.  But we can call this only from the
work, then we can switch to the safer *_up/down() calls.  Then this
assures the runtime resume completion in the work without much races.

With those transitions, basically the cancel_delayed_work_sync() call
at hda_codec_runtime_suspend() can be dropped.  Also, the conditional
schedule_delayed_work() there, too; if we don't cancel, we don't need
reschedule, either.

So the (totally untested) PoC is something like below.
It contains also the fix corresponding to your patch 3, too.


thanks,

Takashi

---
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index c018beeecd3d..5508381a1833 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -639,24 +639,16 @@ static void hda_jackpoll_work(struct work_struct *work)
 	struct hda_codec *codec =
 		container_of(work, struct hda_codec, jackpoll_work.work);
 
-	/* for non-polling trigger: we need nothing if already powered on */
-	if (!codec->jackpoll_interval && snd_hdac_is_power_on(&codec->core))
-		return;
-
-	/* the power-up/down sequence triggers the runtime resume */
-	snd_hda_power_up_pm(codec);
-	/* update jacks manually if polling is required, too */
-	if (codec->jackpoll_interval) {
-		snd_hda_jack_set_dirty_all(codec);
-		snd_hda_jack_poll_all(codec);
-	}
-	snd_hda_power_down_pm(codec);
-
 	if (!codec->jackpoll_interval)
 		return;
 
-	schedule_delayed_work(&codec->jackpoll_work,
-			      codec->jackpoll_interval);
+	/* the power-up/down sequence triggers the runtime resume */
+	snd_hda_power_up(codec);
+	/* update jacks manually if polling is required, too */
+	snd_hda_jack_set_dirty_all(codec);
+	snd_hda_jack_poll_all(codec);
+	schedule_delayed_work(&codec->jackpoll_work, codec->jackpoll_interval);
+	snd_hda_power_down(codec);
 }
 
 /* release all pincfg lists */
@@ -2895,12 +2887,12 @@ static void hda_call_codec_resume(struct hda_codec *codec)
 		snd_hda_regmap_sync(codec);
 	}
 
-	if (codec->jackpoll_interval)
-		hda_jackpoll_work(&codec->jackpoll_work.work);
-	else
-		snd_hda_jack_report_sync(codec);
+	snd_hda_jack_report_sync(codec);
 	codec->core.dev.power.power_state = PMSG_ON;
 	snd_hdac_leave_pm(&codec->core);
+	if (codec->jackpoll_interval)
+		schedule_delayed_work(&codec->jackpoll_work,
+				      codec->jackpoll_interval);
 }
 
 static int hda_codec_runtime_suspend(struct device *dev)
@@ -2912,8 +2904,6 @@ static int hda_codec_runtime_suspend(struct device *dev)
 	if (!codec->card)
 		return 0;
 
-	cancel_delayed_work_sync(&codec->jackpoll_work);
-
 	state = hda_call_codec_suspend(codec);
 	if (codec->link_down_at_suspend ||
 	    (codec_has_clkstop(codec) && codec_has_epss(codec) &&
@@ -2921,10 +2911,6 @@ static int hda_codec_runtime_suspend(struct device *dev)
 		snd_hdac_codec_link_down(&codec->core);
 	snd_hda_codec_display_power(codec, false);
 
-	if (codec->bus->jackpoll_in_suspend &&
-		(dev->power.power_state.event != PM_EVENT_SUSPEND))
-		schedule_delayed_work(&codec->jackpoll_work,
-					codec->jackpoll_interval);
 	return 0;
 }
 
@@ -2943,6 +2929,15 @@ static int hda_codec_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int hda_codec_runtime_idle(struct device *dev)
+{
+	struct hda_codec *codec = dev_to_hda_codec(dev);
+
+	if (codec->jackpoll_interval && !codec->bus->jackpoll_in_suspend)
+		return -EBUSY;
+	return 0;
+}
+
 static int hda_codec_pm_prepare(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
@@ -3008,7 +3003,8 @@ const struct dev_pm_ops hda_codec_driver_pm = {
 	.thaw = pm_sleep_ptr(hda_codec_pm_thaw),
 	.poweroff = pm_sleep_ptr(hda_codec_pm_suspend),
 	.restore = pm_sleep_ptr(hda_codec_pm_restore),
-	RUNTIME_PM_OPS(hda_codec_runtime_suspend, hda_codec_runtime_resume, NULL)
+	RUNTIME_PM_OPS(hda_codec_runtime_suspend, hda_codec_runtime_resume,
+		       hda_codec_runtime_idle)
 };
 
 /* suspend the codec at shutdown; called from driver's shutdown callback */
@@ -3020,6 +3016,7 @@ void snd_hda_codec_shutdown(struct hda_codec *codec)
 	if (!codec->core.registered)
 		return;
 
+	codec->jackpoll_interval = 0; /* don't poll any longer */
 	cancel_delayed_work_sync(&codec->jackpoll_work);
 	list_for_each_entry(cpcm, &codec->pcm_list_head, list)
 		snd_pcm_suspend_all(cpcm->pcm);
@@ -3086,10 +3083,11 @@ int snd_hda_codec_build_controls(struct hda_codec *codec)
 	if (err < 0)
 		return err;
 
+	snd_hda_jack_report_sync(codec); /* call at the last init point */
 	if (codec->jackpoll_interval)
-		hda_jackpoll_work(&codec->jackpoll_work.work);
-	else
-		snd_hda_jack_report_sync(codec); /* call at the last init point */
+		schedule_delayed_work(&codec->jackpoll_work,
+				      codec->jackpoll_interval);
+
 	sync_power_up_states(codec);
 	return 0;
 }
