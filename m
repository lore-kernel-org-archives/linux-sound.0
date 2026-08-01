Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7CF2745E
	for <linux-sound@vger.kernel.org>; Sat,  1 Aug 2026 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785602644; cv=pass; b=KTQMaae6N+1UsIfSkJcrQ3Br4DgQciprcaHZxQVDypVxge1zagiZoheRjXAjglYq8cX13GMIj3cPWu95lt8K0b539QMLvqdRR/FS14wdaDNPzkMpZv0G5O3YeeIraO8ArJ451ZpsYJT7I+MmZY8CXQnVyy8Q+ksn34zwpP+XiSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785602644; c=relaxed/simple;
	bh=mb+MLEyYbechHzf9yXuW+BauxiMY2UxZ27g8S2KdGCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Et/f985soXVlMWlUrL9sZccBeZKeFCMgZKsgt+vjGw/wXbmvvGschQqoeJ1Grhwqt6Vs5aFpnpQmPthRmq5ZuS8QGADE1Mu7xnWgMHGYsXox3hnVY8f3/dTBdqAmKTCPq3Nx7Jbb5d3xVVPAri3+OFJVBmdYl2LZ5qT0/YB0fWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHiKzMUd; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHiKzMUd"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8484f229529so1711211b3a.2
        for <linux-sound@vger.kernel.org>; Sat, 01 Aug 2026 09:44:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785602642; cv=none;
        d=google.com; s=arc-20260327;
        b=NFFyAyEATT8cCX2QM1k5XfMWMCMR2zu9eamijJ+v5GiGsq+ljCGDYYMx+Qt3Gzmo//
         3IgILCe3Ja0xj9ZYdIDz6s2V4jFMj0JNDsJjy8r5BPOz4p+/H0Yy5yRYQnxN8DS2eN/a
         rvDRHFEidxabe8H5EdStdTE+6fMS1b3/MjbQWW2t63ZeVJGzV83ZSTjJOXmAAB19c9KU
         rRF5cfNNcfKpPLsLhapzEawMgp+bA37So1fGVYVBaajif7OLcbyqA20a1kGddUemCDhR
         rNjnktbsTU7KEy4z1dpPTIiPe0VtZc6iwDVfiOdHMHCVv/9OpFmKQYzAs3p4BTbbd5x5
         tl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AH26ZuWNq+ujPPrkDwHkB0FudhrCBpUpPTCu61uR7KM=;
        fh=zYMfwBmyf4MVnQ05uL5ONtQvTDU+scFYZ781IUghjpo=;
        b=rZrW3G11AyRV0HTVOf8aRL1CfUBSoCu1ycAK2+LK1ncQLTe+6i4yVUyuGhphU8V6wA
         fsstHdnd3S4zo8SLx1OJ79xHqvvgSBeV00YtU8xrP2MP5orzwOCj2YoGBnkKkcbX1Tru
         pmqV9OSqJGzyJa9QX2xWChctjYvIcUKw/DcPPBC+MaG5puNuo3gaUgZRnyc0DV9EJikF
         8Cbqta5sb+ZXocdXK3P73b/hC+IjWU46Wl8ruXovJnshUMedQIaBxxz4HmqfUfFLopji
         RsQUxa/nif6QFR6tkUtmk6kmx47ituFLsirJ1b3UBB4osEBvPhjS8Ff2WiZXGHsRS4DI
         ZhQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785602642; x=1786207442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AH26ZuWNq+ujPPrkDwHkB0FudhrCBpUpPTCu61uR7KM=;
        b=QHiKzMUdyY6GQ2q3d7b55DDiwi+m/vnpMN9r/DOxZnW0SzxZfvb4Qodrus/X+nBx72
         2FtsE+GDpYYgrRKVzWan2dmveXQAblWwFr45pwYCs9vWQ5yPpYJkD0eAtC7ty4nAJJFP
         KTK3GBwVSaYCcuVKLTxW2wTYqUnXEJ9JnD92VMw74cih8fdY1DMv32fXuP7cSQitTpaZ
         +Iu9iLFGFMbj0esM+WpJVFrvOBnBjy8SDO9VwxEL3RDhkdVK53ZfNDZTwS8f+jodJJsd
         C5C0QDZrsZCQYc+kactBSy/XxlDiXCCgI4RTZcJPfI4Einaz/AkV3tTWTJcUhdqq01i7
         jR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785602642; x=1786207442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AH26ZuWNq+ujPPrkDwHkB0FudhrCBpUpPTCu61uR7KM=;
        b=F8EZ3dzr61S4Rgd5DEZ1t6EIEummAWRuXEzwf9jRh5p9AQoZpH/mpVxTMeG9uW88HQ
         PpTnq1/VIb58UxFmkI7wfOkQkq15o4U8okGYq80SXL0V049r+C51G23vAdSVnefZmDpm
         tLnKE8YGZuBU7b85UNHL2g9zI9zXGaZ5Dh4w4D0c6UfoWmxtwDagNQObcWCNgIADBX4n
         0haNnGoGfZXNzdLARS4O/3i22ozvTV17yqRYen9AKqahH+2dvG3NBFzzdGk4IManaVBp
         wQsBtYvf0baTbdidM6BhLZVlipYVo05vJY8KdxU8b9ehtIiAUy1+ESBp+0Q5hi4PP1wu
         YRNw==
X-Forwarded-Encrypted: i=1; AHgh+RoPWHYILaOikRt1kiozkOFnhfz4PhcC4RykCcCMHUENh3qTaXwxAqaVxvFYwJuILFxYJFV7FRK1sndhmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBcQv36IcyMoYHgPh2mhxKvtV9FNF/2kFTn4iKiUypP4GqcBmq
	Dw6z/RnEiYGehmqzg7qYfZh4xVmI1xDKO4FVu5H4wJQZdqNyJRKbkizTEUPpAFL0spE6nWfcLQf
	OTQjz/x+ar5RMNfPBY+4umuE+gwD7KXg=
X-Gm-Gg: AR+sD11yFZTBzwx6/6oKrfe3QstZZElFwvAuqIHOrZ0mKfySj0vKOrwYEv+YzLQYWUV
	5p1VmH5INEUULfltzpi7a7/wd8B74vj2T52UzA/ilzip6ZlBhXDRayJQdFj60/Y7CmS/MFq5euU
	4TiscrBrZuMlUn/GENVC6pyDd5VCqq4aS73UQnCyqYSgvUr2Xhj0KxPmaERvMK68k7DG8pbOSO0
	mQ3UfCk+ZOWU0a7TuqYWtapL+XcE3olM+cLUqF3tHLrtMzQJlEi0JsfO2Y8DoaXNZROeqPL/vLc
	/vvvS8UImJCV12hzRxYjiboPy79uSMUWuhDoMnp3B4dHi+fsKGpxug==
X-Received: by 2002:a05:6a00:4518:b0:848:2f74:d8d9 with SMTP id
 d2e1a72fcca58-84ee494acebmr3137898b3a.74.1785602642067; Sat, 01 Aug 2026
 09:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801060630.2768318-1-mapengyu@gmail.com> <DS7PR19MB77249992FF86019C7B2B52BEFCD72@DS7PR19MB7724.namprd19.prod.outlook.com>
In-Reply-To: <DS7PR19MB77249992FF86019C7B2B52BEFCD72@DS7PR19MB7724.namprd19.prod.outlook.com>
From: Pengyu Ma <mapengyu@gmail.com>
Date: Sun, 2 Aug 2026 00:43:50 +0800
X-Gm-Features: AUfX_mwhe2hPBQ2SOLyyHozY_ZKc49DggbLT9k1YRNhERqeTl3RFhjVjl80NHXI
Message-ID: <CALSz7m1PvKUrYvdXfQdA01gfZPh=1eW+1n6HTkxzmk4azn6CHQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ALSA: hda/realtek: Use AW88399 I2C fixup chain on
 Legion machines
To: Marco Giunta <marco_giunta@outlook.it>
Cc: damien.dagorn29@gmail.com, kailang@realtek.com, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	songxiebing@kylinos.cn, tiwai@suse.com, zhangheng@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 8:56=E2=80=AFPM Marco Giunta <marco_giunta@outlook.i=
t> wrote:
>
> Hi Aaron,
>
> I have serious concerns about this series. I addressed some of the
> points below in my previous reply to your review of my v2 patch 3,
> but I will reiterate them here for the benefit of everyone else.
>
> * Patch 1: Default DAC routing
>
> > Retain the existing Lenovo routing
>
> Previously, you stated that the default 0x17->0x03 routing didn't need
> to be changed, but this is NOT the default on these Legions, and in fact
> I think this is just a misunderstanding based on the R9000P.
> That laptop shares the PCI SSID 17aa:38bb with the Yoga S780 entry,
> which chains through to alc285_fixup_thinkpad_x1_gen7 and sets:
>
>     static const hda_nid_t preferred_pairs[] =3D {
>         0x14, 0x02, 0x17, 0x03, 0x21, 0x03, 0
>     };
>
> This is the Yoga/ThinkPad routing, not the Legion's. The actual
> hardware default for pin 0x17 on all known Legion models is DAC 0x06.
> This can be readily verified on a Legion model that boots without the PCI
> SSID collision, and I can personally attest it's the default on my
> Pro 7 16AFR10H (codec SSID 17aa:3938).
> The HDA_CODEC_QUIRK entries in the current code exist precisely
> to prevent this collision by matching on codec SSID instead of
> PCI SSID. It's not impossible that some hardware revisions already have
> the 0x17->0x02 rerouting, but even if such laptops exist,
> on all tested hardware the default routing is the incorrect 0x17->0x06.
>
> Also, your series calls alc285_fixup_thinkpad_x1_gen7 via
> ALC287_FIXUP_LENOVO_XPAD_HEADSET_JACK, so the fact that volume controls
> work at all under your patch is a consequence of the fact that you, too,
> override the default routing (but with 0x17->0x03, which is the DAC
> usually reserved for headphones on these realtek codecs).
>
> In general, not having a DAC override for pin 0x17 WILL break volume
> controls on all supported Legion models. DAC 0x06 has no volume amplifier=
;
> without the override, users get binary 0/100% volume.
> That the 0x17->0x02 fix works and is indeed needed has been verified by
> every tester across all three supported models, confirmed by the Windows
> driver codec dump which selects DAC 0x02 for both 0x14 and 0x17, and is
> consistent with dozens of existing alc269.c entries which perform
> the same override (with comments clearly stating that this is done to fix
> broken volume controls). Also, many of these quirks share a single DAC
> between tweeters and woofers (typically 0x02 for both 0x14 and 0x17)
> without issue, meaning the currently accepted solution doesn't appear
> to be particularly problematic.
>

DAC 0x03 is intentional. The hardware-default DAC 0x06 has no Amp-Out
volume control, while 0x03 has the same volume amplifier as 0x02 and
provides a separate stereo converter for the bottom pair. In 2-channel
mode, 0x02 and 0x03 both receive FL/FR. In 4-channel mode, generic HDA
assigns FL/FR to 0x02 and channels 3/4 to 0x03.

Your quirk forcing 0x17 to 0x02 breaks FL/FR in 4-channel mode.

> Regarding the 0x1d pincfg override: I don't disagree that in practice
> this makes no difference, and I'm happy to have it removed if a maintaine=
r
> asks. This line was simply added to ensure we match exactly the pincfg of
> the official Windows driver.
>
> * Patch 1, 2 and 3: architectural concerns
>
> ALC287_FIXUP_AW88399_I2C_2 is the base fixup that registers the
> AW88399 amplifiers, by binding to the i2c devices created by the SMI
> driver. It should remain generic and applicable to any machine using this
> chip. Stuffing Legion-specific behavior (suppress_auto_mic, headset mode,
> jack renaming, channel maps) directly into this function means any future
> non-Legion machine using AW88399 inherits all of it.
>
> The current design intentionally separates the two new quirks:
> ALC287_FIXUP_AW88399_I2C_2 handles generic amp registration,
> while ALC287_FIXUP_LENOVO_LEGION_AW88399 chains to it and adds
> model-specific fixups. This is the same pattern used e.g. by the CS35L41
> driver quirks, which have a generic cs35l41_fixup_i2c_two and separate
> per-vendor fixup entries that chain to it.
>
> Additionally, replacing a single self-contained ~20-line function with
> a chain of three separate fixup entries
> (ALC287_FIXUP_AW88399_LIMIT_INT_MIC_BOOST ->
> ALC287_FIXUP_AW88399_HEADSET_MIC ->
> ALC287_FIXUP_LENOVO_XPAD_HEADSET_JACK), each with its own chains,
> makes the code harder to follow, forcing a reader to chase through the
> fixup array to understand what the chain does. There's no code reuse
> benefit either, since these new chained entries aren't individually
> shared with other devices.
>
> Patch 1 also removes the "alc287-lenovo-legion-aw88399" entry from
> alc269_fixup_models[]. This entry allows users to force the Legion fixup
> via the model=3D module boot parameter, which makes testing the new drive=
r
> much easier on new Legion models that may need it. Without it, users of
> unsupported models have no way to easily verify whether our driver
> applies to their hardware, and are instead forced to recompile the kernel=
.
>
> * Patch 2: quad channel maps
>
> I tested both patches on my 16AFR10H with music playback.
>
> * With a 2.0 profile: both patches work correctly; tweeters and woofers
>  play together as expected.
> * With a 4.0 profile and my patch: music is fully silent (both tweeters
>   and woofers).
> * With a 4.0 profile and your patch: music plays through the
>   tweeters only, woofers silent.
> This is technically an improvement over full silence, but it reproduces
> the exact broken state that motivated this entire driver effort: weak,
> tinny audio from tweeters with no bass.
>

4.0 test used ordinary stereo music. That source contains
only FL/FR; the bottom pair is assigned channels 3/4, which remain
silent without upmixing.
Please test with `speaker-test -c4`.

> Even if the mapping were inverted so that only woofers played under 4.0,
> it would still be wrong; bass-only audio without tweeters is equally as
> broken.
>
> In general, the only meaningful configuration for this hardware is stereo
> 2.0, where tweeters and woofers play the same signal together.
> There is no useful way to split them into separate channels, because
> they are not separate channels -- they are frequency-divided reproduction=
s
> of the same stereo signal. The bogus 4.0 profiles are an artifact of the
> HDA parser, to be suppressed at userspace level via alsa-ucm-conf
> (or simply ignored in practice), not by adding channel maps at the
> realtek quirk-level. As such, I'm not convinced this patch is needed
> in practice.
>
> Also, as far as I can tell, there is no upstream precedent for mapping
> a laptop's tweeter/woofer pairs as 4.0 surround channels.
>
> * Patch 3: headphone jack rename
>
> These laptops don't have docks. Renaming "Headphone Jack" to
> "Dock Headphone Jack" is semantically incorrect, and I'm not convinced
> the Thinkpad precedent applies here.
> Regarding the need for this change, if there is a GNOME prompt issue
> on plug events, that should be addressed at the userspace level, not by
> giving hardware a misleading name.
> More generally, I'm not sure I understand what problem is being solved
> by this patch, as no Legion user has ever reported any issue
> related to headphones and mic switching. I can also personally attest no
> such issues on my Fedora 44 KDE install on the 16AFR10H.
>

The root cause is the physical combo jack produces both logical
headphone and headset-mic presence signals.
So it should be renamed.

> * Summary
>
> This series modifies a well-tested and necessary DAC override,
> adds surround channel maps for hardware that isn't surround,
> renames a jack to work around a quirk specific to one desktop environment=
,
> and mixes generic and model-specific fixups in ways that will affect
> future devices, while making the code harder to read and to test on
> new devices.
> None of these changes have been tested by the testers who validated
> the current code.
>
> Based on data from our github repo, I can attest that the current
> fixup chain has likely been used by at least ~250 people in the last
> ~4 months across multiple kernel versions (from 6.19.10 to present)
> and distros (Fedora, Arch, Cachy, Debian, Ubuntu, Nobara),
> with no reports of mic switching or headset detection issues, instead
> reporting that the 0x17->0x02 override was able to remove the need for
> the alsa-ucm-conf workaround that was previously used to fix broken
> volume controls on this hardware. As such, I am a bit surprised by this
> patch series, and I admit I'm probably misunderstanding something or
> missing some important context.
>
> If the suppress_auto_mic and headset mode changes address a real mic or
> headset issue on these Legions which I'm currently misunderstanding
> and didn't happen to hear about previously, I'm happy to have them
> incorporated as a separate patch on top of the existing fixup chain,
> while preserving the crucial DAC 0x02 override needed for working
> volume controls. But I'd first like to better understand what problem
> they solve, as no Legion user has reported mic switching or
> headset detection issues.
>
> May I ask, on what Legion model (with what codec SSID) did you test
> these changes? Is there a bug report thread I may read to get
> more context?

Tested on 0x17aa3906
Analyzed alsa-info on 0x17aa3928.

The issues on current for-next branch are:
1, The 4.0 output is broken, no FL/FR. 4 speakers are visible on laptop.
2, when plugin headset, the mic is lock in headset mic, no switch to
Internal Mic.
3, when plugin headset with quirk of HEADSET, switch to Internal Mic,
but the input device is not valid.
4, Headset button is no response.
5, dmesg report "SKU not ready 0x411111f0"

Aaron

>
> Best regards,
> Marco
