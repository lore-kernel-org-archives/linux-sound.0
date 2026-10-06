Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAB03C9EE8
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 21:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791322041; cv=pass; b=VAi7zMhJyE8Idw9j0/dVIQHE6PeRUpfYq9yv/XmvoE5XLfZRdXXH7K9eb2nlLAg2W3LEz49vyjbY4IsjfdLCF+/0VoNikxUIr22fNJDgYksXGDLpEq5JgQ0CTpaTVUacZTQh51f93dbsP1vsHBEeWnfGe/g2sdkZE4CZoAoqzCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791322041; c=relaxed/simple;
	bh=ZF+zRmvFS1BroEPeKg+X0AWJMqO3jSUGyZqHlYfNrlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khRb1c8ZIarhJxdMvob0fThpMbGnEXL0jRla/Vcs/uDmUV1TzM/43EdidnWZcbNSuVQevylu4i/6TaJOOPWGVICzLSeA2/csXtyBSNhJrqGD4euuZ7SUwi02KmxpxMhorTeMGOpW7xIpVSOzxnTngSERbrt6aXVdPwhTt1lcJHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mox8Ov6U; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mox8Ov6U"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-351348eb579so1417135eec.0
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 14:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791322039; cv=none;
        d=google.com; s=arc-20260327;
        b=L6oTP7BeTuZ3zvjxFt6JcOTrM1NTyOIK5vTta0bG7WNYPMijPmN69FCCriXSX5+1LL
         Y3ezJbihk5gUw/2wQ1kmFjNUBZ/1Wao0vrtMn4XsV5tDr60DXWLBENwr8AHQFu+L6bLJ
         M5Q08wJi08zdHuxFvyV67y5n4MrR5T8MT5URb0+iVaIaV9IBxNQTug/uI+2wk1wcSpD1
         zpjPpgb/Lundpn7KVN848fQzr6zoB6eidN+wZQJRkxFqSjotIzuwYlzSoE+zeGnDbgCP
         g1koreUmuZxk1EF8FxHJ/80gv+uYRxGvLWYAyCVb6wKim4D8owWi1C9xXTOkff0MmMjN
         XC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rRJ2MtelPwL5klYN4F3h1n6SZrtiTxDCAi+/56xIYtA=;
        fh=vuK1/mc5k35ftl1oWld21HLVbGIG5IVXZzdTmfrqewc=;
        b=DVliF26irioL5Ekop4BVH9NlGzr1Yo0hU0BInK6nfY6XSP97il8Jrel746LqY92EPn
         fMHWFd0R8sqow6WjGEzETyRfhioHD2ciCV4e5X5EyxznVDrgEIPBJhIcU0jvF0mih4FU
         mhvg2yf/zayjoOpsgm5sgD8n1eKRmYmQE0/97TkFQv5/d6encKD2Mz/Z8iLi7o3vsdyn
         s0l5jASgivFvDhUgJ/IDcMclVflTLp/8Up+U/BnbMNtaKZ9i4dZ0H5zJAN/jSwAQzaMm
         WLj2mQzzcmlbWbd6vVxpbAwQ9cQqgbKQDpeCMiQDjrQYETfW1CP7e6IlBjxcj3FB9U8x
         aUIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791322039; x=1791926839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rRJ2MtelPwL5klYN4F3h1n6SZrtiTxDCAi+/56xIYtA=;
        b=mox8Ov6UnNhMCzjAAIom+lutbOv+cZM+eIWvVp104W4goMdLBi2CkrWnRUOL4J4XAI
         lArRXHMQBNlM5zxZcbaNcC8sj6HOL3tnq6bD9mG1nggrIg39f+Dv7/uSKrKKUB71NZU8
         ayWStNV6SE7KFlybrvz4pBYtuPIkdT0e3CGPIkPLHQQFcm7gv3ZiA/qJyAG1Dym0T/Sy
         Cir+l8VteJFSaS+sabbyNgW2tQFC5rknKX/MCrtFJirt8frJ6WCpOLiyYJCeLxfo60wW
         I+Vlu3cCYKmGuxXMc0FEvxqixe6tWlz7aFmyDBfeirmYEAG5G57uDOqgGcCrXoT09Exa
         cVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791322039; x=1791926839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRJ2MtelPwL5klYN4F3h1n6SZrtiTxDCAi+/56xIYtA=;
        b=Kwtzk90ifae64q064eTQaBuoX5Lx37tV3q3J71t1iP5Xd3j4kPo8P9LB4y0oYwOtGr
         3eU7KEo0veTgT3ekGI68mXLrlwMUKEmInQjcnsK7qL17Lxcw6/orGmxk7b8VBtBW2/41
         M1PQcItb3Z4bVGCh+ImhUWirvmAf2O7nyGMnhCbhJ2zNxnkSgBEaG5rFg9Q6sMLLlXFt
         tKRW0C8vjRFowd4r9Gu3zxy5cPh+75FN+v6TwW5noEHxvT1WKeoEQ7vWDDnurUAfpYm1
         4fq8DriVdOLPTxBqoiC3HZQQRbKq1Z8PvfNo8VOTgabeCCID0X7/nJykveBKtlnD2qit
         0CAg==
X-Forwarded-Encrypted: i=1; AKwUvBx9da1ZdL/6dmtcLToZlLMtxC352wVmfHbJ4vqKP/IQIQw8SPSw1FYQamjNxQqqnH1IEschts/FbpG5TQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nl5tmJwYKVcC0nlKqWTInXaFJwpvXkgh9jK6rw+MlJhH/xPJn1
	AN5oeNMXN9kyiHPJWyALdFgR95HGrYDrW+aINk4hlgr9WjSXiz4L2x0u9Nj3Sh+V9lLTB/TWYbt
	4zPjm7UyCpogJC+Lb2wkylOmBHIPJgKGFWSy5jIs=
X-Gm-Gg: AYBFou08TH6ZulYWDYwo2Cs8hB72aNtDPpLgUbVDubhTMqtGeMKli1boaDja+6Ln3oP
	RIF4kMfhXYRcWSsUUj3IpvK2Yuohe9pcmRjjJScDrxK9RnZvRVlnzy2S3Lk4Jg8KpDjlpoo2gOD
	BT8ImoXtgWpSWgHxvqQdRnF738/IndOiMz5A3k2OWwcGeHerdXBChUd4Rojxzlif9w443kTN5rL
	LlnGyGiGnYHr41vv4s1Xj/2Lc+PFYp7MUu/njgyWxN6+0WsKkbdu0Yt4087hy3oiuo7u+EZr2Rt
	dHpWq/+ACQKHhgrclg+Hv7a2j0TuBepwxAirM7Wb4kv0JnBPv2SW3cemTRRRdumGuA==
X-Received: by 2002:a05:693c:87cd:10b0:351:5dd:18fe with SMTP id
 5a478bee46e88-3514501f3d0mr4158731eec.1.1791322038808; Tue, 06 Oct 2026
 14:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFmy3_zQ1VNUJJ9H1kkvHxf50Pg9AQ4H1rXZbyz6-zxJxcYowg@mail.gmail.com>
 <33d869bc-ec8a-4d9e-8ba4-350bddce7ccf@linux.dev> <asOVTdEvVmbQ78fB@sirena.co.uk>
 <CAFmy3_xCeAE+H93xf0wKnrhwLdqCA7Fdxrgtunom7JUqhh3vLw@mail.gmail.com>
In-Reply-To: <CAFmy3_xCeAE+H93xf0wKnrhwLdqCA7Fdxrgtunom7JUqhh3vLw@mail.gmail.com>
From: =?UTF-8?Q?David_M=C3=A1rquez?= <davidmarquezfernandez@gmail.com>
Date: Tue, 6 Oct 2026 22:27:04 +0100
X-Gm-Features: AclHuK8hmY1I4tCOe_JI1Euc_94WXjM1AVAqiPQBh7Kaub6_F9AdkcsM0O9XCCQ
Message-ID: <CAFmy3_z7Pev+1UDy4J1SLR8DO5EL9nEXy1k0Y1TRH5RgydiMJQ@mail.gmail.com>
Subject: Re: [BUG] ASoC: Intel: sof_es8336: speaker amp GPIO stays off after
 stream stop/restart (no sound until "Speaker Switch" is toggled)
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, kai.vehmanen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pierre-Louis, Mark,

I now have data for your question. I traced sof_8336_trigger() (kprobe,
with the cmd argument), sof_es8316_speaker_power_event() (event
argument), gpio_value and the DAPM widget power events with timestamps
over about 24 hours of normal use, and correlated them with 11
occurrences of the dropout (my out-of-tree workaround logs a message
when it finds the speakers-enable GPIO low at stream start).

Short answer: it does not depend on the time between stop and restart.

1) All 11 occurrences are a STOP (cmd=3D0) immediately followed by a START
(cmd=3D1) 2.5 to 5.3 ms later, both issued from PipeWire's real-time data
thread (pw-data-loop), on a PCM that stays open. There is no DAPM power
event in between (no ev=3D4 and no ev=3D2 in any of the 11). The trigger
drives the GPIO low on the STOP, "Speaker Power" is never power-cycled,
and at the START the GPIO still reads back low (I read it in all 11
cases). My workaround then re-enables it about 75 ms later. The
playback time before the failing STOP varies from 2 seconds to about 24
minutes. It looks like xrun/resync recovery from the data thread, but I
have not confirmed the cause on the PipeWire side.

2) Normal stop/restart cycles never failed. The same trace has 46 other
STOPs, all issued from the main pipewire thread when the PCM is closed
after being idle. Each one is followed 14-21 ms later by
sof_es8316_speaker_power_event(ev=3D4) (DAPM powers "Speaker Power" down),
and each restart is preceded by ev=3D2. 45 of them were followed by a
restart, from 1.5 s up to several hours later (8 restarts in under 3 s,
2 between 3 and 5 s), and none failed. So in my case the delayed
power-down timer is not what matters: DAPM turns the speaker supply
off right after the STOP, and I only see the 5 s delayed DAPM run later,
from a kworker.

3) About your suggestion: today the trigger switches the amp off at
STOP, about 15 ms before DAPM starts powering the codec down, while the
GPIO write from the power event goes through the 70 ms delayed work (I
measure it 71-79 ms after ev=3D4, when the widgets are already off). So
simply dropping the trigger handling would leave the amp enabled for
about 70 ms on an already powered-down path, which I would expect to
pop. I will test a variant that (1) removes the GPIO handling from the
trigger and (2) switches the amp off synchronously in the PRE_PMD
event, before the widgets power down, keeping the delayed work only for
the power-up. I will report whether the dropouts disappear and whether
I hear any pops.

Raw trace excerpts are available if useful.

Thanks,
David Marquez


El lun, 5 oct 2026 a las 22:30, David M=C3=A1rquez
(<davidmarquezfernandez@gmail.com>) escribi=C3=B3:
>
> Hi Pierre-Louis, Mark,
>
> Thanks for the quick feedback.
>
> > Does this happen if the time between stop and restart is greater than
> > 3s, or only when the delta is really short?
>
> I don't have systematic timing data yet, so I can't say for sure. What I
> have so far:
>
> - It still happened once with pmdown_time set to 0 on the codec and BE
>   links (I caught the speakers-enable GPIO low after a dropout in that
>   configuration). With pmdown_time at 0, DAPM powers down immediately on
>   close, so a missing power-up after a quick restart should not be
>   possible there. That makes me think the short-gap case is not the only
>   path.
> - My suspicion is a STOP/PAUSE_PUSH on a PCM that stays open (for example
>   xrun recovery, or drop+prepare on the same open stream). DAPM only
>   powers down on hw_free/close (after pmdown_time), so no power cycle
>   would happen regardless of the gap, while the trigger has already
>   switched the GPIO off. I have not verified this yet.
>
> I am now collecting a trace with kprobes on sof_8336_trigger() and
> sof_es8316_speaker_power_event(), plus the gpio_value and DAPM widget
> power events, and I will correlate it with the moments where my
> workaround finds the GPIO low on resume. I will report the sequence and
> the time gaps.
>
> > alternatively you could deal with power management only in
> > sof_es8316_speaker_power_event(), and completely remove the transitions
> > on trigger start/stop/pause.
>
> Agreed, that looks cleaner than adding work to the trigger path. I will
> test that variant on my machine (and listen for pops at stop and pause,
> which I assume is why the trigger code exists) and report back.
>
> https://github.com/thesofproject/linux/issues/5967
>
> Thanks,
> David Marquez
>
>
> El lun, 5 oct 2026 a las 13:17, Mark Brown (<broonie@kernel.org>) escribi=
=C3=B3:
> >
> > On Mon, Oct 05, 2026 at 01:22:10PM +0200, Pierre-Louis Bossart wrote:
> >
> > > Does this happen if the time between stop and restart is greater than
> > > 3s, or only when the delta is really short? In the latter case, IIRC
> > > there's a DAPM feature where the power down happens with a delay, to
> > > avoid unnecessary power transitions. so if the new stream starts
> > > immediately, then the power-up transition will never happen.
> >
> > Yeah, the default timer is 5 seconds.
