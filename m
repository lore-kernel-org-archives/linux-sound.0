Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7295169D11
	for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696902; cv=none; b=EFj8OXII3A6xl4umr2zGoMMqtZi1gg1sjs3smxpnCBVopkkmzhMUvhVOYP8EOKcX5W140yN7gA/LLu+624tdexY3KfKHxbHwOojjHB4BhlYTM0A2WMS0uLXU7EZPRbCHKP7eV3GFKy30NoWhFNvzdI4BQ/sFn9R1d3e3Wr5L/Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696902; c=relaxed/simple;
	bh=GKZ8w0AYPz6V2nrzI2vaEKShIgHSQsdVyKVzG/1043w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnXyU0Q5lcAFMcpu8TgQp4m3VB52Z0+J92mIkEoejZQm9bEBgULNe59bJ6qDBbO/VPNPLXoqykzYISZWw0p2Us27Y5xNQa3UrP6kY7SyN/WcyeErkfEWWSFFkbwTSfQ7iL5FQ0UrJ9s8QrgQAddJ5aFP73bp0jdXXhcv9MIvR28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIvfOIpz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIvfOIpz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-339289fead2so3768544f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 02:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706696898; x=1707301698; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tlI/qumYeaqkaUH8jzPX1UvgcR7RJ5Ay93SAHjj/YmI=;
        b=OIvfOIpzVUndhPxna4wa4IpZManD/gH5d5ACPSEBVPGv/KjoEqdu2APEA4lU91KWR5
         6a87uRs5zS2RdcXNYFnHKaDXJEI5BPJNni03ziLXVY1QVSgC0/DuNqluFlPUsf9sB9A9
         x9YIIdM8XCVUE+1NTzv1Q2cfpIBhX5SJ2V0Wj+EjxAwD1FqRwaMZ5Xr7EBzB8Qfm0kQP
         /x37j2Nx5zteavV6S+o7P3eM2wiEaKjQUKtXPGafNWot212sRBLxUhCdzQhl8iQuN6Mq
         R2OzA3q5WZuRAmXb883sRbCR2N2ZY2TvpwyXtjGc+GPCZD9Ovr9iFom7P7/hqmr2Kd0b
         ieIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696898; x=1707301698;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tlI/qumYeaqkaUH8jzPX1UvgcR7RJ5Ay93SAHjj/YmI=;
        b=XlNhW9H7EriZZ3R/jdeD4csDMgZX39HQ3SBjo/jBtwtq9IqtNCIIKu6aosQNC4mv1h
         frBmx8WBokq8SOxbFs+aotdLRu4ByzwKOBvxjQx/108mkicOj6BYQOLIh2mN6Wvy7GyC
         n6+t/LdWGnjVQu+UP+WQ0qwuNOcska999PH6YNuFOaz7KgLFRdR1lZGA+Yu4tdNNe786
         MBZlc2ecOaaBbWgxnlpcFwKu/maiHGnw0e4DWwn/oahaMqwMgJ7lAUnDLbpU6W4KeXWw
         skFTV2woxr0L+umpXn8MJSWI4lTYfxHlOwSvXbEJPaxCwRSWwN/qC1JKsFhmPKiUG1JO
         zxBA==
X-Gm-Message-State: AOJu0Yy7PYwIfIue+C6iXwOv6eO1zVdD4PmvDG0l7jmWLtEBuHq5B4Ih
	rmrtkUtGJbL5d/bujc9KyA2U+AW3bA+2TpqQ5E4Vu4Oa+Zc2kxqH
X-Google-Smtp-Source: AGHT+IFB6cTV7rkoEnHeOBJOvlGB0g9yPyXJpH4XW/EmVDDkW0mSpxGQQei2OH5xE1f2UkdcnBns3A==
X-Received: by 2002:adf:ee84:0:b0:33a:fe1f:7484 with SMTP id b4-20020adfee84000000b0033afe1f7484mr919337wro.61.1706696898334;
        Wed, 31 Jan 2024 02:28:18 -0800 (PST)
Received: from aquecedor-3-0 ([2001:818:e81c:ce00:7193:3bd:90d8:9d8])
        by smtp.gmail.com with ESMTPSA id b3-20020a05600003c300b0033afe6968bfsm2578111wrg.64.2024.01.31.02.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:28:17 -0800 (PST)
Date: Wed, 31 Jan 2024 10:28:15 +0000
From: =?iso-8859-1?Q?Jos=E9?= Relvas <josemonsantorelvas@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] Apply headset jack fixup for alc287 thinkpads
Message-ID: <Zbogv_GdHlz5dZsQ@aquecedor-3-0>
References: <20240130192536.10298-1-josemonsantorelvas@gmail.com>
 <871q9y2cle.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871q9y2cle.wl-tiwai@suse.de>

Thanks for the reply!

Sorry about the misformatted patch. I did send in a second one through git-send-email. Is it not correct either? 

Anyways, the reason I'm editing the existing quirks is mostly because ALC285_FIXUP_THINKPAD_HEADSET_JACK was actually wrong.
It was actually always linking to the X1 gen 7 quirk, which has some kcontrol changes only meant for a few models with bass speakers.

It looks like this: 

/* Quirk for Thinkpad X1 7th and 8th Gen
 * The following fixed routing needed
 * DAC1 (NID 0x02) -> Speaker (NID 0x14); some eq applied secretly
 * DAC2 (NID 0x03) -> Bass (NID 0x17) & Headphone (NID 0x21); sharing a DAC
 * DAC3 (NID 0x06) -> Unused, due to the lack of volume amp
*/
static void alc285_fixup_thinkpad_x1_gen7(struct hda_codec *codec,
					  const struct hda_fixup *fix, int action)
{
	static const hda_nid_t conn[] = { 0x02, 0x03 }; /* exclude 0x06 */
	static const hda_nid_t preferred_pairs[] = {
		0x14, 0x02, 0x17, 0x03, 0x21, 0x03, 0
	};
	struct alc_spec *spec = codec->spec;

	switch (action) {
	case HDA_FIXUP_ACT_PRE_PROBE:
		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
		spec->gen.preferred_dacs = preferred_pairs;
		break;
	case HDA_FIXUP_ACT_BUILD:
		/* The generic parser creates somewhat unintuitive volume ctls
		 * with the fixed routing above, and the shared DAC2 may be
		 * confusing for PA.
		 * Rename those to unique names so that PA doesn't touch them
		 * and use only Master volume.
		 */
		rename_ctl(codec, "Front Playback Volume", "DAC1 Playback Volume");
		rename_ctl(codec, "Bass Speaker Playback Volume", "DAC2 Playback Volume");
		break;
	}
}

On second review, this does break some routing with older alc285, as the speaker and headphone NIDs are still 0x02 and 0x03.
Maybe cloning the x1 gen 7 fixup, but without the renamed ctls, is the more appropriate solution here? Let me know what your thoughts are.

Sorry for the confusion.
José Relvas

On Wed, Jan 31, 2024 at 08:20:29AM +0100, Takashi Iwai wrote:
> On Tue, 30 Jan 2024 20:25:36 +0100,
> José Relvas wrote:
> > 
> > Thinkpads have a fixup for alc285 which enables headset media buttons, but not for alc287.
> > This patch removes the chain to the X1 gen 7 fixup in the alc285 headset fixup, making it applicable for models without bass speakers.
> > It then chains said headset fixup with every alc287 thinkpad fixup, making headset media buttons work for these laptops.
> > 
> > Signed-off-by: José Relvas <josemonsantorelvas@gmail.com>
> 
> Thanks for the patch.  But the changes look too intrusive.  We don't
> want to change the behavior of the existing quirk entries
> unnecessarily.  Your change will break if anyone explicitly uses a
> specific model option, for example.
> So, please rather create a new entry for handling the headset jack and
> use it (maybe better with some comments).
> 
> Also the patch isn't cleanly applicable.  Your MUA broke tabs and
> spaces.  Please fix the setup, or use git-send-email.
> 
> 
> thanks,
> 
> Takashi
