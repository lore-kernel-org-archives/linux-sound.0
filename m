Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552702698BE
	for <linux-sound@vger.kernel.org>; Thu,  3 Apr 2025 19:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707172; cv=none; b=VCAoJRSRdhXqrjsTtEZZ4INBiPzgH4Msb7z6Yqfw9D/JR+V4bhC33yQ+E3BwBr2+tRzfJy4vlzx8DsWISVmDhxdf/8YKtXtCpaXQDB2PkSqVWyvmxIIp3y+IQBalF6Wri96M80JtF1QAa8m/thSUb1RHEclyYQqIUlWavnbwLNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707172; c=relaxed/simple;
	bh=+JKdaXPtg9wkNt2RCM+Ql0gyFCsVRXHU/igsRwqrr9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PnDAxvbb90/NSwpwbr08cEtduUJqq2167wBp8u24kPAaouzD+EFmVPTLVlDQWPAzS8UJoWZ4LBWQN01UT/7e2IZqNTeNwnZgg3c+e6lLQCDjtPbJE11MaQESx41/X35p56330EYMbZgYtQclD1vrnvL8Xgz4X7Ob/e0F67c9SMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=Lx8QEeQW; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="Lx8QEeQW"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9381C3ECCE;
	Thu,  3 Apr 2025 21:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9381C3ECCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1743707163; bh=GfV0m3qGpoBFTQ0qBodi3aemU3CfBRYdcSOalfw/WFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lx8QEeQW0nmPj6ln2DM3inR2CDDIkxNjfeh2Gao2L4foFvecA5G9+kP8Lga85lOpa
	 GzPIyY3OPymkzOoqX/mItdhxev3afKCPw2/ZVsHv12DE5fYwP7uoSDbdtJ1f7+qcFu
	 xwP+g5l0n32htvfUv0EsYq+oBpMOUBShuJYj9tnM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  3 Apr 2025 21:05:52 +0200 (CEST)
Message-ID: <b9d457b9-4645-4876-b6a1-82bb658a3b8f@perex.cz>
Date: Thu, 3 Apr 2025 21:05:51 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if
 resume is not supported
To: Takashi Iwai <tiwai@suse.de>
Cc: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
 <87r02cym1c.wl-tiwai@suse.de> <9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
 <87jz83ztn7.wl-tiwai@suse.de> <206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
 <87h637znpp.wl-tiwai@suse.de> <35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
 <8734eryn21.wl-tiwai@suse.de> <ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
 <87v7rmylc5.wl-tiwai@suse.de> <d4169edb-1dcc-4eef-9f3e-9b8c93cdc648@perex.cz>
 <87o6xeyfkk.wl-tiwai@suse.de>
 <69c52779-ef90-45c5-a024-77f0030bf5cd@linux.intel.com>
 <87jz82ye7b.wl-tiwai@suse.de>
 <8878feb6-362a-4541-91fb-318aea1c0870@linux.intel.com>
 <87o6xe7l4q.wl-tiwai@suse.de>
 <51bf9695-1f70-4749-b70a-2ed4af8c4be7@linux.intel.com>
 <871pu95oon.wl-tiwai@suse.de> <2bc811f1-7fbd-45f1-924e-e6241dcef537@perex.cz>
 <87plht447q.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <87plht447q.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03. 04. 25 18:09, Takashi Iwai wrote:

> Last but not least, the ASoC PCM core has its own DPCM state, and the
> trigger-SUSPEND skips the operation unless the stream has been
> running.  I believe that's the very starting point of the problem
> Peter's patch tries to address.

Unfortunately, after all discussions, I'm not convinced about Peter's patch. It smells like an workaround rather than a fix for forever. The problem is there for years so we should not concentrate on a quick fix.

>> Also, I would consider to call suspend/resume triggers (depending on a
>> flag like can_pause_release_stop) when the stream is paused, too. Some
>> drivers may want this scheme.
> 
> Do you mean drivers that do share the same operation for
> suspend/resume and pause?

Many drivers supporting pause may use it when we allow PAUSE -> SUSPEND and SUSPEND -> PAUSE transitions.

Something like:

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index ac8f3aef9205..6d6882973883 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -541,6 +541,8 @@ struct snd_pcm {
         bool internal; /* pcm is for internal use only */
         bool nonatomic; /* whole PCM operations are in non-atomic context */
         bool no_device_suspend; /* don't invoke device PM suspend */
+       bool do_suspend_and_resume_in_pause; /* allow direct PAUSED -> SUSPENDED and
+                                               SUSPENDED -> PAUSED transitions */
  #if IS_ENABLED(CONFIG_SND_PCM_OSS)
         struct snd_pcm_oss oss;
  #endif
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 4057f9f10aee..3ec4ef7809ea 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1694,8 +1694,11 @@ static int snd_pcm_do_suspend(struct snd_pcm_substream *substream,
         struct snd_pcm_runtime *runtime = substream->runtime;
         if (runtime->trigger_master != substream)
                 return 0;
-       if (! snd_pcm_running(substream))
-               return 0;
+       if (! snd_pcm_running(substream)) {
+               if (!runtime->do_suspend_and_resume_in_pause ||
+                   runtime->state != SNDRV_PCM_STATE_PAUSED)
+                       return 0;
+       }
         substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND);
         runtime->stop_operating = true;
         return 0; /* suspend unconditionally */
@@ -1798,8 +1801,11 @@ static int snd_pcm_do_resume(struct snd_pcm_substream *substream,
         /* DMA not running previously? */
         if (runtime->suspended_state != SNDRV_PCM_STATE_RUNNING &&
             (runtime->suspended_state != SNDRV_PCM_STATE_DRAINING ||
-            substream->stream != SNDRV_PCM_STREAM_PLAYBACK))
-               return 0;
+            substream->stream != SNDRV_PCM_STREAM_PLAYBACK)) {
+               if (!runtime->do_suspend_and_resume_in_pause ||
+                   runtime->suspend_state != SNDRV_PCM_STATE_PAUSED)
+                       return 0;
+       }
         return substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_RESUME);
  }

This will allow to address this problem correctly without any pause release just to put all parts to the running state and immediately stop the stream. Ideally, all drivers should be migrated to this state scheme and the condition may be removed at the end.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
