Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA373D5C31
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 05:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791351443; cv=pass; b=dz5tMFFuXdSmoVi4AJy6fRx2YYq6LiDubUKpzTM7tejyBLvTQ6gNRUeprwyiiwkScwssdKV622Gc5Hs4A8Mk0HZBuTpYhhRIP0uZK93AEmQk7d1mr7edqxqnv02tvjzJ0h2xa67wbjnyHrK/sLn2gENOQjB/KLLoQDAplw0pSps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791351443; c=relaxed/simple;
	bh=ERIkONVrz63Z82BBop6Nmwqq2ZCOP1RqC16b4wpJVas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfIYNIb6gUfG2SAc7ZKW6mlIpBcDRYtMMGWBKQxGZY/MXZNu/cjWUWcvqkH/KdfptIk27TXHSRMJL14jBoApDMiXlrZy86W+WT6mIaLsZV3GwYI1yZKbJo3p9XfHIA5OILduuD2fr7oDJyeBI2fqN5TctYy7kNoeOg0d1H4YAAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKwUOfV4; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKwUOfV4"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so10452762eec.0
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 22:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791351441; cv=none;
        d=google.com; s=arc-20260327;
        b=D8J8xyf44Ld2lDtfiXLh5vY5/Dj4n8fSU2iWh/nZbM68jDdownlowHMQYM+GMDIYMl
         mJQIJ/9RK3OQdkRwfqmiHaM+CD00RX7k4GEK7HY4MHW/J+4eFPuCc1595LKfTXPr5sJv
         T/wuInUVCUlcaeG3oKUDb+SUxBixu0VntGSoClKD4bbYVUxk6jfs1lB/ww+5/ZtVZk71
         6s+NjdKwqNPTMQ98+IEaeMWqHtsLdcdv3KrhYp2JRIZATEh9G3JBZI2kCRGKIrJOU/DC
         2jozZW4IHlCe2Rj5C2My774UxBw0YnOCwS/DwwoPmkkLMMTomEKUZK200LaiGKMYAf4q
         szFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LgUSH+A+/WALB+vCYzUFheoD/Aa2zhPil6d9gv+ojbo=;
        fh=8rFH106MjqaVPcSWhJ05cqXLuKA2VESB8o4WHLPhpcQ=;
        b=ltWHTQDeIi+NPU6rKu5j6MkNICPJrz+q+nDjpd0bwZ+npC8dbIaDEaZ1/NWNwdZ6+x
         x4YzqCaBIlmdy8vPfegvRF65PMH3EGCYPOr/TWN4ISXGapGjXCkZWTixlDFOND1xw62x
         v1TAwYa/h9i6wgBiCk1vygKXD1rjd68RuTuLt/QqVkf7Zbpts3yO0gAeq/CsulCb6MA8
         VZfHUufQGSDW7IWJypFEB3k6gt1cxBruB2/bf5m3OlehhtVgU0u9Y8P9y7nDhsIXRtRn
         /jRhhnjxcvR0L4M+CPdDHbsNtac7q0pD80NydzS85oGdVeOX79d82m11TAl4LxoS5X7h
         2FMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791351441; x=1791956241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LgUSH+A+/WALB+vCYzUFheoD/Aa2zhPil6d9gv+ojbo=;
        b=BKwUOfV4u53VxQlFsE9P+ZCWgy8f062NuuTZYcTwlyi9sMN/uLYBIMmyXEJSnrifW5
         sSNIHUQImCqjsyijq1hFV1ljVNjc6aB4YkgCsTKsFNnJhxOi694lt2l77b/fWAsJv1Pz
         vX38B7fr5cKJMKO55GoO55PbNOTTRF6Mf13EFhSjrRzR7JcT0O/rFThGMHreBGmQn3ky
         U2z17ok57c5ZsYg3RIrWpX/fuimwYxvXeCOUkKu7AzX4sKANa1yr+SaepKwHZEl2g6vQ
         1c1g8BeHoNRxsoauaI62i/d+WcedObF4Qpt6+iBeYw4Lbux2qD/UJ9E40PS3zAOfnods
         oPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791351441; x=1791956241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgUSH+A+/WALB+vCYzUFheoD/Aa2zhPil6d9gv+ojbo=;
        b=w24YngU3j+H9TTVEaq/U0FFPjsvLfgoEYSrbVgOfNjd0iLT6+TpfPbU7OnNE8PLHbz
         7JPk8beXOFLGVn5YUPvZVcn33joKOHBg4pBV9uvQz6wXAaleMkg9CjOv+LV88XP1O/yE
         NNGiAZHvOkKWnLvAJCagdzp7YTz3DV04KxgZ+cT4Rr5FKr06AmANSlfp6w3uTn6c6wgl
         lsFIXzQ+RXHQhiU2GBaZ8Lq7CIvkkxeOAy47DhDUL3vTlkEoIBLKkCSUCX7TD2qMgUal
         hMwtPThgSdWFxJWRKd1nISNvIPwNMj9UEFxS/NrYWbcjhldsv+ic9m9cuj0riaezCU9e
         afyg==
X-Forwarded-Encrypted: i=1; AKwUvBz3OskxzO3kaVTlM98Y7CcCEx8Us3AXtSq+wZlkyTNfS57T0zDSotmFYmQFY3yKR9ni8jx4Qmb524ilbQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKEWNCevwvc0GRhoOY2V08qnr0xEMtwDy0xc84x3AUrcIqI0/M0
	mc5wJqlfZLWvTd9vf/5uEZoyUApSKcB0HvERW5xv/7UqnLCvG3WO2RbPCSkN+JklzTfVvPAjgqu
	KjZXJYUPVD0yF6DgCKov+cHau/ue3jwVRWHg4BV4=
X-Gm-Gg: AYBFou289unW2MXfjpqqWi3BdsCI6iRdtkcB8pOpfXzz7zxAV5fnPgG+vFLN4va004+
	8IF6pQs0KiBlsiG6vFkXglq3+C33aFSUQyYNxhMtOAcIYAgQK8AzJscPjZ47JXgt74Ec2jLCk9F
	Beu1juVzZu6OctPxMK+v2iXG+sNs1+SNBbrdChjPPgKPyVAb/SYKVUQOShtQ50n7F28hgWmqC9f
	HAscmZNJ0lbFWIxiD4Dq2Q/tIPMt/J05lUyLK2vYMqQBmE7hJp56jqFLB66Lhr65WQLgxNdN7yX
	1Wu+LxjMUa8i4CUg1eJR17rwvk/gIY/PTOI0obGacglJVZnKK7XhsAc=
X-Received: by 2002:a05:7301:4e4a:b0:351:1dff:ae1f with SMTP id
 5a478bee46e88-3515deedc25mr1178062eec.41.1791351440468; Tue, 06 Oct 2026
 22:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFmy3_zQ1VNUJJ9H1kkvHxf50Pg9AQ4H1rXZbyz6-zxJxcYowg@mail.gmail.com>
 <33d869bc-ec8a-4d9e-8ba4-350bddce7ccf@linux.dev> <asOVTdEvVmbQ78fB@sirena.co.uk>
 <CAFmy3_xCeAE+H93xf0wKnrhwLdqCA7Fdxrgtunom7JUqhh3vLw@mail.gmail.com> <CAFmy3_z7Pev+1UDy4J1SLR8DO5EL9nEXy1k0Y1TRH5RgydiMJQ@mail.gmail.com>
In-Reply-To: <CAFmy3_z7Pev+1UDy4J1SLR8DO5EL9nEXy1k0Y1TRH5RgydiMJQ@mail.gmail.com>
From: =?UTF-8?Q?David_M=C3=A1rquez?= <davidmarquezfernandez@gmail.com>
Date: Wed, 7 Oct 2026 06:37:08 +0100
X-Gm-Features: AclHuK_uXABNpG_tyZBdHOo8u79uEeXbfAKkE9Wih4bV4RmryTwGcb6MmeJ-5Bw
Message-ID: <CAFmy3_w7XKYWAGPo_02ewGjoZBtw+LiV_pt7VbNLJ1xB77eodQ@mail.gmail.com>
Subject: Re: [BUG] ASoC: Intel: sof_es8336: speaker amp GPIO stays off after
 stream stop/restart (no sound until "Speaker Switch" is toggled)
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, kai.vehmanen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pierre-Louis, Mark,

A follow-up on the variant I mentioned: I tested it on my machine.

Variant tested: sof_8336_trigger() no longer touches the speaker GPIO,
and sof_es8316_speaker_power_event() switches the amp off synchronously
in the PRE_PMD case (cancel the pending work, set the GPIO to the "off"
level, return), keeping the 70 ms delayed work only for the power-up.

Result: I hear a pop from the speakers each time the stream is closed
after being idle, about 5 s after the last sound (when PipeWire
suspends the sink and DAPM powers the codec down). I do not hear it
with the original trigger-based switch-off, nor with my START-side
workaround. My guess, which I have not verified, is that "Speaker
Power" is a supply and DAPM powers supplies down after the output
widgets, so the amp is still enabled while the output stage goes down.
The trigger STOP path switches it off about 15 ms before DAPM starts,
which looks like the reason it exists.

So the early switch-off in the trigger seems necessary, and what is
missing is the matching switch-on when the stream restarts without a
DAPM power cycle. I stopped the test of this variant early because of
the pops, so I cannot say whether it also removes the dropouts (by
construction it should, since the GPIO would only follow DAPM).

The smallest change I have validated is the START-side one from my first
mail: on START/PAUSE_RELEASE/RESUME, if speaker_en says the amp should
be on and the GPIO is low, re-enable it. It does not add a delay to the
trigger itself: it only schedules the existing pcm_pop_work (the same 70
ms used for power-up). With it, 11 occurrences in about 24 hours were
corrected with no audible dropout and no pop, and the normal close and
reopen paths are untouched.

Would you prefer that approach, or do you see a cleaner way to keep the
early switch-off for pop suppression while keeping the GPIO state
consistent with DAPM? I can turn it into a proper patch and test it on
my hardware.

Thanks,
David Marquez

El mar, 6 oct 2026 a las 22:27, David M=C3=A1rquez
(<davidmarquezfernandez@gmail.com>) escribi=C3=B3:
>
> Hi Pierre-Louis, Mark,
>
> I now have data for your question. I traced sof_8336_trigger() (kprobe,
> with the cmd argument), sof_es8316_speaker_power_event() (event
> argument), gpio_value and the DAPM widget power events with timestamps
> over about 24 hours of normal use, and correlated them with 11
> occurrences of the dropout (my out-of-tree workaround logs a message
> when it finds the speakers-enable GPIO low at stream start).
>
> Short answer: it does not depend on the time between stop and restart.
>
> 1) All 11 occurrences are a STOP (cmd=3D0) immediately followed by a STAR=
T
> (cmd=3D1) 2.5 to 5.3 ms later, both issued from PipeWire's real-time data
> thread (pw-data-loop), on a PCM that stays open. There is no DAPM power
> event in between (no ev=3D4 and no ev=3D2 in any of the 11). The trigger
> drives the GPIO low on the STOP, "Speaker Power" is never power-cycled,
> and at the START the GPIO still reads back low (I read it in all 11
> cases). My workaround then re-enables it about 75 ms later. The
> playback time before the failing STOP varies from 2 seconds to about 24
> minutes. It looks like xrun/resync recovery from the data thread, but I
> have not confirmed the cause on the PipeWire side.
>
> 2) Normal stop/restart cycles never failed. The same trace has 46 other
> STOPs, all issued from the main pipewire thread when the PCM is closed
> after being idle. Each one is followed 14-21 ms later by
> sof_es8316_speaker_power_event(ev=3D4) (DAPM powers "Speaker Power" down)=
,
> and each restart is preceded by ev=3D2. 45 of them were followed by a
> restart, from 1.5 s up to several hours later (8 restarts in under 3 s,
> 2 between 3 and 5 s), and none failed. So in my case the delayed
> power-down timer is not what matters: DAPM turns the speaker supply
> off right after the STOP, and I only see the 5 s delayed DAPM run later,
> from a kworker.
>
> 3) About your suggestion: today the trigger switches the amp off at
> STOP, about 15 ms before DAPM starts powering the codec down, while the
> GPIO write from the power event goes through the 70 ms delayed work (I
> measure it 71-79 ms after ev=3D4, when the widgets are already off). So
> simply dropping the trigger handling would leave the amp enabled for
> about 70 ms on an already powered-down path, which I would expect to
> pop. I will test a variant that (1) removes the GPIO handling from the
> trigger and (2) switches the amp off synchronously in the PRE_PMD
> event, before the widgets power down, keeping the delayed work only for
> the power-up. I will report whether the dropouts disappear and whether
> I hear any pops.
>
> Raw trace excerpts are available if useful.
>
> Thanks,
> David Marquez
>
>
> El lun, 5 oct 2026 a las 22:30, David M=C3=A1rquez
> (<davidmarquezfernandez@gmail.com>) escribi=C3=B3:
> >
> > Hi Pierre-Louis, Mark,
> >
> > Thanks for the quick feedback.
> >
> > > Does this happen if the time between stop and restart is greater than
> > > 3s, or only when the delta is really short?
> >
> > I don't have systematic timing data yet, so I can't say for sure. What =
I
> > have so far:
> >
> > - It still happened once with pmdown_time set to 0 on the codec and BE
> >   links (I caught the speakers-enable GPIO low after a dropout in that
> >   configuration). With pmdown_time at 0, DAPM powers down immediately o=
n
> >   close, so a missing power-up after a quick restart should not be
> >   possible there. That makes me think the short-gap case is not the onl=
y
> >   path.
> > - My suspicion is a STOP/PAUSE_PUSH on a PCM that stays open (for examp=
le
> >   xrun recovery, or drop+prepare on the same open stream). DAPM only
> >   powers down on hw_free/close (after pmdown_time), so no power cycle
> >   would happen regardless of the gap, while the trigger has already
> >   switched the GPIO off. I have not verified this yet.
> >
> > I am now collecting a trace with kprobes on sof_8336_trigger() and
> > sof_es8316_speaker_power_event(), plus the gpio_value and DAPM widget
> > power events, and I will correlate it with the moments where my
> > workaround finds the GPIO low on resume. I will report the sequence and
> > the time gaps.
> >
> > > alternatively you could deal with power management only in
> > > sof_es8316_speaker_power_event(), and completely remove the transitio=
ns
> > > on trigger start/stop/pause.
> >
> > Agreed, that looks cleaner than adding work to the trigger path. I will
> > test that variant on my machine (and listen for pops at stop and pause,
> > which I assume is why the trigger code exists) and report back.
> >
> > https://github.com/thesofproject/linux/issues/5967
> >
> > Thanks,
> > David Marquez
> >
> >
> > El lun, 5 oct 2026 a las 13:17, Mark Brown (<broonie@kernel.org>) escri=
bi=C3=B3:
> > >
> > > On Mon, Oct 05, 2026 at 01:22:10PM +0200, Pierre-Louis Bossart wrote:
> > >
> > > > Does this happen if the time between stop and restart is greater th=
an
> > > > 3s, or only when the delta is really short? In the latter case, IIR=
C
> > > > there's a DAPM feature where the power down happens with a delay, t=
o
> > > > avoid unnecessary power transitions. so if the new stream starts
> > > > immediately, then the power-up transition will never happen.
> > >
> > > Yeah, the default timer is 5 seconds.
