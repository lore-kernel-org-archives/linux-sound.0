Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A4C23A989
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 12:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598561; cv=none; b=DLeJKU4UhoJIS5WVi6oTAgLbOrvSDJfXOh6Vx/ga8r9Sp3JC6Mka6XzVZtd7Inrf9J82Duz9n2EKdnhFGAWqABDYgu+8hLO8oaBybo7LZ4rYFtomZf+0DD+0UrYsuK1dsQVjovIfMGPmcGOkgD6r5M9nY4paNKN1df1Wpcw4xKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598561; c=relaxed/simple;
	bh=C/PVZ5LfrZxqQmrp4knapGoAzqYeYuT/rNRo7KMYH7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGHfE3WDLAEE76dAqaAflBdSYO1pKjp4QQO05TJkR15myrCQ8r2eXJcY7GOvNTb0Z4xaokbdJPi94Ouxit63C/2DfUXsDhzC3qEabrYZjD899aL4i1Ndk3zYi/gMccFHU0hFSylN9nOTqOYDhy77SEWYnQgbU4wUuM7s5aaUQ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=t6Qw+ICG; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="t6Qw+ICG"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8BD403ECCB;
	Wed,  2 Apr 2025 14:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8BD403ECCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1743598553; bh=32OxWn+xHatQDhR3Xd4D1VK0CUsglbc7cLq/ktjFEo8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t6Qw+ICGIoLXFBsp19xw8vYbTHWPDKrJT95lbCCtMNoYZUe7qutbC3NAW1WXJ2S/g
	 3h3Z5Q/M+Q42VaOkYwW+CX8j++L5jjwnB2YEolZAC8Fo9ufU2AGq0FfYXG9HsdFYY9
	 lb1AjBmqhjjtY7NhyOQsYBv6yZRT7uVp4V7OUgRI=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  2 Apr 2025 14:55:42 +0200 (CEST)
Message-ID: <69ac49d4-70b2-4814-bb03-cdd43e34f74b@perex.cz>
Date: Wed, 2 Apr 2025 14:55:41 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if
 resume is not supported
To: Takashi Iwai <tiwai@suse.de>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 xsFNBFvNeCsBEACUu2ZgwoGXmVFGukNPWjA68/7eMWI7AvNHpekSGv3z42Iy4DGZabs2Jtvk
 ZeWulJmMOh9ktP9rVWYKL9H54gH5LSdxjYYTQpSCPzM37nisJaksC8XCwD4yTDR+VFCtB5z/
 E7U0qujGhU5jDTne3dZpVv1QnYHlVHk4noKxLjvEQIdJWzsF6e2EMp4SLG/OXhdC9ZeNt5IU
 HQpcKgyIOUdq+44B4VCzAMniaNLKNAZkTQ6Hc0sz0jXdq+8ZpaoPEgLlt7IlztT/MUcH3ABD
 LwcFvCsuPLLmiczk6/38iIjqMtrN7/gP8nvZuvCValLyzlArtbHFH8v7qO8o/5KXX62acCZ4
 aHXaUHk7ahr15VbOsaqUIFfNxpthxYFuWDu9u0lhvEef5tDWb/FX+TOa8iSLjNoe69vMCj1F
 srZ9x2gjbqS2NgGfpQPwwoBxG0YRf6ierZK3I6A15N0RY5/KSFCQvJOX0aW8TztisbmJvX54
 GNGzWurrztj690XLp/clewmfIUS3CYFqKLErT4761BpiK5XWUB4oxYVwc+L8btk1GOCOBVsp
 4xAVD2m7M+9YKitNiYM4RtFiXwqfLk1uUTEvsaFkC1vu3C9aVDn3KQrZ9M8MBh/f2c8VcKbN
 njxs6x6tOdF5IhUc2E+janDLPZIfWDjYJ6syHadicPiATruKvwARAQABzSBKYXJvc2xhdiBL
 eXNlbGEgPHBlcmV4QHBlcmV4LmN6PsLBjgQTAQgAOBYhBF7f7LZepM3UTvmsRTCsxHw/elMJ
 BQJbzXgrAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEDCsxHw/elMJDGAP/ReIRiRw
 lSzijpsGF/AslLEljncG5tvb/xHwCxK5JawIpViwwyJss06/IAvdY5vn5AdfUfCl2J+OakaR
 VM/hdHjCYNu4bdBYZQBmEiKsPccZG2YFDRudEmiaoaJ1e8ZsiA3rSf4SiWWsbcBOYHr/unTf
 4KQsdUHzPUt8Ffi9HrAFzI2wjjiyV5yUGp3x58ZypAIMcKFtA1aDwhA6YmQ6lb8/bC0LTC6l
 cAAS1tj7YF5nFfXsodCOKK5rKf5/QOF0OCD2Gy+mGLNQnq6S+kD+ujQfOLaUHeyfcNBEBxda
 nZID7gzd65bHUMAeWttZr3m5ESrlt2SaNBddbN7NVpVa/292cuwDCLw2j+fAZbiVOYyqMSY4
 LaNqmfa0wJAv30BMKeRAovozJy62j0AnntqrvtDqqvuXgYirj2BEDxx0OhZVqlI8o5qB6rA5
 Pfp2xKRE8Fw3mASYRDNad08JDhJgsR/N5JDGbh4+6sznOA5J63TJ+vCFGM37M5WXInrZJBM3
 ABicmpClXn42zX3Gdf/GMM3SQBrIriBtB9iEHQcRG/F+kkGOY4QDi4BZxo45KraANGmCkDk0
 +xLZVfWh8YOBep+x2Sf83up5IMmIZAtYnxr77VlMYHDWjnpFnfuja+fcnkuzvvy7AHJZUO1A
 aKexwcBjfTxtlX4BiNoK+MgrjYywzsFNBFvNeCsBEACb8FXFMOw1g+IGVicWVB+9AvOLOhqI
 FMhUuDWmlsnT8B/aLxcRVUTXoNgJpt0y0SpWD3eEJOkqjHuvHfk+VhKWDsg6vlNUmF1Ttvob
 18rce0UH1s+wlE8YX8zFgODbtRx8h/BpykwnuWNTiotu9itlE83yOUbv/kHOPUz4Ul1+LoCf
 V2xXssYSEnNr+uUG6/xPnaTvKj+pC7YCl38Jd5PgxsP3omW2Pi9T3rDO6cztu6VvR9/vlQ8Z
 t0p+eeiGqQV3I+7k+S0J6TxMEHI8xmfYFcaVDlKeA5asxkqu5PDZm3Dzgb0XmFbVeakI0be8
 +mS6s0Y4ATtn/D84PQo4bvYqTsqAAJkApEbHEIHPwRyaXjI7fq5BTXfUO+++UXlBCkiH8Sle
 2a8IGI1aBzuL7G9suORQUlBCxy+0H7ugr2uku1e0S/3LhdfAQRUAQm+K7NfSljtGuL8RjXWQ
 f3B6Vs7vo+17jOU7tzviahgeRTcYBss3e264RkL62zdZyyArbVbK7uIU6utvv0eYqG9cni+o
 z7CAe7vMbb5KfNOAJ16+znlOFTieKGyFQBtByHkhh86BQNQn77aESJRQdXvo5YCGX3BuRUaQ
 zydmrgwauQTSnIhgLZPv5pphuKOmkzvlCDX+tmaCrNdNc+0geSAXNe4CqYQlSnJv6odbrQlD
 Qotm9QARAQABwsF2BBgBCAAgFiEEXt/stl6kzdRO+axFMKzEfD96UwkFAlvNeCsCGwwACgkQ
 MKzEfD96Uwlkjg/+MZVS4M/vBbIkH3byGId/MWPy13QdDzBvV0WBqfnr6n99lf7tKKp85bpB
 y7KRAPtXu+9WBzbbIe42sxmWJtDFIeT0HJxPn64l9a1btPnaILblE1mrfZYAxIOMk3UZA3PH
 uFdyhQDJbDGi3LklDhsJFTAhBZI5xMSnqhaMmWCL99OWwfyJn2omp8R+lBfAJZR31vW6wzsj
 ssOvKIbgBpV/o3oGyAofIXPYzhY+jhWgOYtiPw9bknu748K+kK3fk0OeEG6doO4leB7LuWig
 dmLZkcLlJzSE6UhEwHZ8WREOMIGJnMF51WcF0A3JUeKpYYEvSJNDEm7dRtpb0x/Y5HIfrg5/
 qAKutAYPY7ClQLu5RHv5uqshiwyfGPaiE8Coyphvd5YbOlMm3mC/DbEstHG7zA89fN9gAzsJ
 0TFL5lNz1s/fo+//ktlG9H28EHD8WOwkpibsngpvY+FKUGfJgIxpmdXVOkiORWQpndWyRIqw
 k8vz1gDNeG7HOIh46GnKIrQiUXVzAuUvM5vI9YaW3YRNTcn3pguQRt+Tl9Y6G+j+yvuLL173
 m4zRUU6DOygmpQAVYSOJvKAJ07AhQGaWAAi5msM6BcTU4YGcpW7FHr6+xaFDlRHzf1lkvavX
 WoxP1IA1DFuBMeYMzfyi4qDWjXc+C51ZaQd39EulYMh+JVaWRoY=
In-Reply-To: <87jz82ye7b.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02. 04. 25 13:50, Takashi Iwai wrote:
> On Wed, 02 Apr 2025 13:43:57 +0200,
> Péter Ujfalusi wrote:
>>
>>
>>
>> On 02/04/2025 14:21, Takashi Iwai wrote:
>>>>> On the second thought, yet another variant would be to introduce only
>>>>> one new trigger, SNDRV_PCM_TRIGGER_PAUSE_RESET, for resetting the
>>>>> PAUSED state as a step before stopping the stream.  This can be
>>>>> applied to all cases for snd_pcm_drop() and snd_pcm_suspend(), too.
>>>>> If the driver doesn't support this mode, the PCM core may fall back to
>>>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE.
>>>>
>>>> This looks identical to my proposed
>>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE_AND_STOP which is more
>>>> explanatory. It's not clear what PAUSE_RESET should do (probably the
>>>> stream should be kept inactive).
>>>
>>> There is a slight difference.  My proposal, *_TRIGGER_PAUSE_RESET,
>>> doesn't have to stop the stream by itself, but it's only a preparation
>>> for stopping.  That is, a proper TRIGGER_STOP always follows after
>>> TRIGGER_PAUSE_RESET.
>>
>> But what state that we move after we reset the PAUSE? is it RUNNING
>> (iow, equals to PAUSE_RELEASE) or something else?
> 
> It'll be temporarily set to RUNNING.

I don't think that there's requirement to change state at this point. It would 
be better to keep PAUSED state and add this state to the running state checks. 
Something like:

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index ac8f3aef9205..166ef0376293 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -708,6 +708,12 @@ static inline int snd_pcm_running(struct 
snd_pcm_substream *substream)
                  substream->stream == SNDRV_PCM_STREAM_PLAYBACK));
  }

+static inline int snd_pcm_active(struct snd_pcm_substream *substream)
+{
+       return snd_pcm_running(substream) ||
+               substream->runtime->state == SNDRV_PCM_STATE_PAUSED;
+}
+
  /**
   * __snd_pcm_set_state - Change the current PCM state
   * @runtime: PCM runtime to set

But...

>> In case of suspend while the state is paused we will:
>> TRIGGER_PAUSE_RESET followed by STOP or SUSPEND?
> 
> For suspend, PAUSE_RESET, then SUSPEND.
> For dropping, PAUSE_RESET, then STOP.

I'm not convinced if the functionality/information split is a good idea in 
this case. The preparation (code) for suspend and stop may be different. With 
separate triggers, drivers know exactly about the requested behavior (and we 
know it at trigger call time already).

Perhaps, more universal triggers like SNDRV_PCM_TRIGGER_STOP_PREPARE and
SNDRV_PCM_TRIGGER_SUSPEND_PREPARE may be invoked (always) before STOP/PREPARE 
triggers  Drivers should handle also the pause state there on it's own to keep 
the DMA transfers in idle for those cases.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
