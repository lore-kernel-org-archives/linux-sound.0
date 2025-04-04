Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B7C19D081
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757051; cv=none; b=bI16XSXiq675wXSaK6mG/Ycs8W2z/rnlbWXy1pS/02guejUqyBHrPLojfZ+Z4UQ0KaOyMKFZ5nwBENX1+QDdsllE6Ena+wA3WYbSBzEm3sPzdtv0Kjqnystcq/ZCEa3HABjn8PO4KSsWTRD9Jk284G98th0k7+xvHlM6RwGFrEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757051; c=relaxed/simple;
	bh=Ym8WorKnqKjAn7sNVpurnd8X2NtXbUIiln8xFj+XaGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ND60Ntq+5VFCP+LGZ7vb8C8lWYXQVThlPKbB4YRExa5lbZM6d+mzeomoMDj7DjulH/l4iw7k+8hmGwqUoonm0j/ZnY8bcwHb/PsHjDQWhM8mKqfmvaHPsKHkoflZ8FmVB7WxLrZTlBT2NZ6sR9HQnC5t0Z+71jAzSbM663POjUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHRQIp/Y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHRQIp/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743757049; x=1775293049;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ym8WorKnqKjAn7sNVpurnd8X2NtXbUIiln8xFj+XaGs=;
  b=RHRQIp/YigcuxHtZlXJYxfVzLTHr++5E0hXr/AC3lA3Y56FoCldC/gSU
   u467SPpnaUXi/sa1i1Sf12/wABxPtu7g25ZbvaDCKL/j/uCgN5LFc3kXZ
   ZvXWYDCT2teqGJPjM+DP45wD1miwUY0LSlLhtvJ3LlGTUhsw3t98ZMkv3
   cz5T+KMuviaxZD+aWNVP9GWtfjaSyR1IRQCLx+w+b+1POQYNnJkrVOfuw
   OTit1q8N+zr1J6u6igbcCzUYRap36IAx37jItzG6JQp7QD4n4T/LsrfTh
   GFYdM3u3DzS0wFB+3uZpQJCz6j1XP60LISkl45LsFgRkoN+VyRQOhTK0q
   Q==;
X-CSE-ConnectionGUID: 0l3aPNxzTyi3yEWke0LoZw==
X-CSE-MsgGUID: HW0Po3NGTTmGjbM8cy+wLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70563885"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="70563885"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:57:29 -0700
X-CSE-ConnectionGUID: E0h2UXWXTOqJGZnZhsRpOg==
X-CSE-MsgGUID: djxpK5r9SM+EtPlQBw31vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="127198753"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.248.2]) ([10.245.248.2])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:57:25 -0700
Message-ID: <517d9020-379f-42e5-89c6-9d81e4666af6@linux.intel.com>
Date: Fri, 4 Apr 2025 11:58:18 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if
 resume is not supported
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
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
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <2bc811f1-7fbd-45f1-924e-e6241dcef537@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 03/04/2025 18:24, Jaroslav Kysela wrote:
> On 03. 04. 25 16:01, Takashi Iwai wrote:
> 
>> I agree that your patch can be a good start, at least, it addresses
>> the existing issue with the minimal change.  There are still rough
>> edges and we'll need to address, but I believe the patch (or modified
>> / fixed one) can be applied to 6.15 kernel, while keeping the
>> development for 6.16.
> 
> I did a quick research how is RESUME/SUSPEND implemented in current
> drivers and I found that it may be considered to enable SUSPEND trigger
> also in the paused state:
> 
> find sound/ -name "*.[ch]" -exec grep -A 2 -B 2 -H -E \
>     "SNDRV_PCM_TRIGGER_(RESUME|SUSPEND)" {} \;
> 
> My comments - seems almost all drivers handles SUSPEND as STOP:
> 
> sound/pci/ymfpci/ymfpci_main.c
>  - STOP/SUSPEND different, should not be a problem
> sound/pci/nm256/nm256.c
> sound/pci/intel8x0.c
>  - only saves suspend flag additionaly to STOP
> sound/soc
>  - some drivers ignores suspend/resume (ignore_suspend flag)
> sound/soc/pxa/pxa-ssp.c
>  - should not be a problem (enable/disable hw parts)
> sound/soc/sti/uniperif_player.c
>  - only resume trigger is supported ? but no resume info is set
> sound/soc/sof/intel/hda-dai.c
>  - only suspend support, but resume is not supported
> sound/xen/xen_snd_front_alsa.c
>  - it's just rpc
> sound/virtio/virtio_pcm_ops.c
>  - only suspend support, no resume
> 
> It would be probably nice if more eyes verifies this, but the only
> suspicious place is the xen front end. And some drivers may be broken
> already (no changes for them).
> 
> I believe that this patch should be enough to resolve the issue instead
> the non-elegant pause release and may be applied also to 6.15:
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 4057f9f10aee..63a1b37cc098 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -1694,8 +1694,17 @@ static int snd_pcm_do_suspend(struct
> snd_pcm_substream *substream,
>         struct snd_pcm_runtime *runtime = substream->runtime;
>         if (runtime->trigger_master != substream)
>                 return 0;
> -       if (! snd_pcm_running(substream))
> -               return 0;
> +       if (! snd_pcm_running(substream)) {
> +               if (runtime->info & SNDRV_PCM_INFO_RESUME)
> +                       return 0;
> +               if (runtime->state != SNDRV_PCM_STATE_PAUSED)
> +                       return 0;
> +               /*
> +                * When resume is not supported, SUSPEND should STOP
> stream.
> +                * For futher operation, the stream must be fully restarted
> +                * to leave the permanent SUSPEND state.
> +                */
> +       }
>         substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND);
>         runtime->stop_operating = true;
>         return 0; /* suspend unconditionally */

I have tried similar thing and the original problem remains that we are
missing the PAUSE_RELEASE trigger for the PUSH and ASoC core stops the
SUSPEND trigger to reach the drivers.

> 
>                 Jaroslav
> 
>> I did some quick work on it, and now implemented
>> SNDRV_PCM_PAUSE_RELEASE_STOP trigger.  I guess it's more or less
>> aligned with what Jaroslav suggested.
> 
> Nice cleanups. The "ALSA: pcm: Save the proper suspended_state for non-
> resumable case, too" should be recoded. The state should be handled in
> action callbacks for all streams separetely.
> 
> Also, I would consider to call suspend/resume triggers (depending on a
> flag like can_pause_release_stop) when the stream is paused, too. Some
> drivers may want this scheme.
> 
>                     Jaroslav
> 

-- 
Péter

