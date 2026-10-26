Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793051106;
	b=wUHWIxqLldVT1pxkm5/BTs8JnVz9nW5oZ8ZO5WaVP5useP7nvjQVF8V4wcjStdzxv8tw
	 whRjRdPHSb5UeyQek9NBNo7t4I3r0vw4bSV5XIj440sGaYhltXgL0nHGv0XnjuGEUQxes
	 P6RMv4t9pOZqKWViqsxCpgieBk8bpuptHsoX1uY1c5VsgB2CJnFUk/Ay32Y35lfunM3lw
	 0dTtLIyQBfydzjYPSFmnKGVsXxQ8j+Mg1J4YrhQEqa4CrbGLoWXNc8m0CQmaqOl2urjiu
	 3uPOpAAZcQnMm9z3p+lJz7WXVpy+YagJwckxFuIePxKM1PXJSYusOhI4ORdN8KDXJSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RcfvlemgCTZlIBY/k2jUOT8Q1Nv2+ZFBdkrs4l7Ures=;
	b=ZfBLn/XJ9h6bIA8Gm1AEmAas8EXUIw+U1TOJHQhjVFF4kSKGPO449RIasPfrN+OsuO/l
	 eWDF5sDL3pFJo/p2WxUcVLBqKAOoJQlkIz5J060CBJPkW2MwQSBuhxtIOvDob5FJTfUwy
	 tWpJdNJVofKukCJWx/nUuNMjiQmppDqG0a3dgnWATqz4WXHiX3GQCbeAJpxerQLEyUjd+
	 4TRBDGizZsfAHRJpx7doWnGXL1Mfjbs0qXA6e8ykMVon3NlzPUZa1rXVGnzQzyNdV+Lxw
	 O+Lb3M3VFe2VH/Tn6Dql8spk5MVXCaxs2pZHpp3EQaopwkMaP/VprdpszML/J0qTpDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="cPl7BAV/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E57D606A32F
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 21:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E57D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cPl7BAV/
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfc346401aso663075e87.0
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 14:45:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793051104; cv=none;
        d=google.com; s=arc-20260327;
        b=nNHsZuNie1rgcJVQwClKZGOqWbI1vtwc5piGX1RyWjn0wYhnHp0ufYqtcvhGc4K1hi
         NpxxsBtxuWzOCz44JZMbqcnTaCbUbnUK7TPuNGh1GnYM/AKEVb4qJP3fxwoeaMpXNtL+
         IuMXVADjqvluVoZPMhezUBdEpr3mEPV9vaGYuyyZKPBsxYlXkVO7WnyqGrWCFpPxBq7P
         03gdDtxY75qFXfG1Le12GalRpjuO3OzEE2mw5Ijh/1dHNA4H1HZyVDT8JixsUeduk5Wx
         XOcAafcjti5LgysDSoRiX3TtJIHJ/gE4fKJ/AzXJOYbxhtH7P7qrDyTewvD5ypcWEVjf
         N5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RcfvlemgCTZlIBY/k2jUOT8Q1Nv2+ZFBdkrs4l7Ures=;
        fh=Va1KQJL/gRCXAti0WY1u7xILN3BvovGQEHuMe42VGPo=;
        b=ggQDwXwSyv5b7Wc0F37vya/t00PvC6PJ8O3Hu0xR9wgmI8g9Vck4FfXng0SEiXsfRQ
         x5yWwxpwXQWvzUj6gP+8R1FOwY1gkMde5mQE60cOkNFFP2q119E5Y667uFmJSNu06Fle
         IhRncWaUi0FZwKmJBJ1NAkcbOxvQOHiOARl685Lv1MYezaB3ftm3LqaqqN6Zvk2eVUx/
         tJw9Uprz141BCCCMFTG0LIlUsqugYSyQzn0V235vzKj5bnayFb2kMC19MdTo4/I4F0im
         IPTovxsB7lHG4+GBdoN8MWyMqNvZas7svhMs/uSzLVjzEydZQeqPJtgzRr0GdLm8dbr1
         x+BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793051104; x=1793655904; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcfvlemgCTZlIBY/k2jUOT8Q1Nv2+ZFBdkrs4l7Ures=;
        b=cPl7BAV/EQ44x7OQoitBw7m+OVC9E66/NZNcin4y+oWs83ZmQ79/4A0oi/9sQineRh
         AH7anqMyhEmvtu7T727k452z3UK5baGS3lqH22b6juVITOEzoRCvZp+ba3+mP0K/1rbu
         dDS/WUnvUKHZHy88Bz5BClTQLVRz7LV1tnUgcAn7xhEXswOIZags0GlRm423a8txjywv
         XBZeYG3VFbgIzPz+YIZR4d931Ava+TYCURGkhkHHGxzYPUL6z/cA5sKAIAADzn7Xv2e6
         DkPM1Nt0UboWyviyxsNn2ZMLJ7EhuquMAXSsOWkPgsS4lMzHGAkELfk036iSlfluV4Ea
         Hv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051104; x=1793655904;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RcfvlemgCTZlIBY/k2jUOT8Q1Nv2+ZFBdkrs4l7Ures=;
        b=GLPfwUqi0MiOlKtaYwGlRboIZNAgsx4MCTcfC8l9Kl6OMF18D+eCrFaN2NhFlfd8sE
         M5fseGOGUfKlBvEoLt8eFG102tw4HaCA6JR04d051xbbHCZyF744Sld5aY62hSVbwmdM
         Kn7qPibluiRahY9rRD9aDfWDJaA6MY09wo6IiuIqsezTAjK/DjDoDYuNFGYqxsIpGKpX
         NzQLPTM1egXB4RQwPdgJne2K6fSkxXtPkjVynhlEyyJ8eFnTlEre9DfOJedUfU5ipM/4
         QNQKEFZt1H+YXONKcUfazSfQVbtHuMSp+/V7P4uVVJO/Z8+nPErg5MnBXhjTT3tr1JzI
         cC3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy0sp+izGfcb8Qnis2lrEFb83i+QJntGreUx+k2qyzxDE2u/nf5uXns0tUF+c4OrTuW03ne5/2CjS1n1A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLos8vgAl2Tvbvo1Z60NXVvsoVPEONcrmVIluPSucNLxMd3/fl8
	fdOEaiiQ6UPhgTGVBw50wK9qB8radN2yiapYTdfEequpQnHXXkoYM5AZplp4obc8yevaNRTuWnD
	Wz+QOd2ctAXGpDGUX1Srl/EXWIPcyF/Y=
X-Gm-Gg: AYBFou24mTDqgfdWMqhqvfi9r3YY0W01+g0oJV6G8dYC6KEt75UFez6onDzBcd2myMN
	Lua69ovrOa7ovqRpKhSsjQBeRVfucc2V+8xxXMjHqIVZYBJJVa+D7wo1ZtA7Sy0JNUu8YGtex0A
	yihzX0jTUcf5qJNyp9A5KZEtfixH164J6kFl80bp2t0F9jDhny7YKxxsxqtXdGHxsGHu6zDX2p1
	j84lpnKUQWdseCWkJA+KuJJe++AFnRbXX7uzGsoWnLODrXegN9eCxAE7zsylnwVWk91sJbBWWC0
	KJJg4eDOp9wy7YMoxCbDakflkmgyuzsnAoWSmFkdrPYMKq58SGfUlvcDeR7U0bJpyVv6uUnAN09
	vkR/b0BN4ubBbgi0BTN9ltDXJwXIWaJXip9CsEtcaYGbBTCXsU5VS6sOmd8wiAvgpZGH61Ji6JE
	878u+RsKhfCI8aFvyD
X-Received: by 2002:a05:6512:39c7:b0:5bf:b14f:beb6 with SMTP id
 2adb3069b0e04-5bfb71ceab6mr2640493e87.55.1793051104260; Mon, 26 Oct 2026
 14:45:04 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019230159.834954-1-mrwillporter@gmail.com> <at-dpPOGs2zD2fuL@khmer.arcnet>
In-Reply-To: <at-dpPOGs2zD2fuL@khmer.arcnet>
From: Will Porter <mrwillporter@gmail.com>
Date: Mon, 26 Oct 2026 16:44:50 -0500
X-Gm-Features: AclHuK9tUQE0tf_YAoVLwJma_OAqCZzGDMvFDjxOPoIp64S0vvpQ1r31I3IqvTw
Message-ID: <CAMZ8TExJThTMZVvbDMVdtXSB-edGAsAnmKYtAtM1CCw0pDvNGw@mail.gmail.com>
Subject: Re: [PATCH 0/5] ALSA: usb-audio: Audient iD14 MkI vendor controls
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Andrews <neil@androos.io>
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Mon, Oct 26, 2026 at 07:36:24PM +0100, Christian Ruppert wrote:
> I took a look at this question and it seems like we can share the majority
> of code in the EVO driver by complementing it with the following features:
> - variable width read/write
> - caching of write-only values
> - enum data type

Thanks for looking into this so closely, and for the fixes. I like
the idea of one driver, and I'd like to find out whether the iD line fits.

Your TLV in patch 4/4 is the same one I use for the iD14 matrix: same
unit 0x3C, s16 in 1/256 dB, -128 to +6 dB. That made me wonder whether
the iD14 matrix could use your MIXER type almost as it is. Its channel
number is input * 4 + output, so Main L/R and Cue L/R of each input
are adjacent, like your stereo pairs. Could we expose it as 28
controls with two values each, rather than my 56 single-value ones?
An input's level and pan in a mix set its L and R values together,
so a pair seems a natural fit. Does that look right to you?

> The only part which seems more problematic is probably FU12 which looks
> like it requires some custom logic and would still need actual code.

Agreed. I'd keep FU 12 as its own code.

A few questions about the rest:

1. Read before write. As I understand it, the put handlers in
   mixer_evo.c read the value first to see if it changed. On the iD14,
   GET stalls for mic boost, input polarity, optical mode and the iD
   key function, so a put that reads first would fail there. Talkback
   source always reads 0, so a read would hide real changes. Could
   these write-only controls skip GET in both get and put, with get
   returning the cached value? And could every put still send the
   value, even when it matches the cache, so that "alsactl restore"
   reaches a device that was reset?

2. The cache. My driver writes a known value at probe (off or none,
   and for optical mode its measured power-on mode, S/PDIF) and
   updates the cache only after a full-length write. If the probe
   write fails, an enum reads "Unknown" and a switch reads off. Would
   that approach work for you?

3. Control entries. The iD14 table uses 16 unit/selector pairs and
   explicit control names, such as "Main Out L Source Playback Enum".
   It also needs volumes in 1 dB steps (0..128, stored as s16
   1/256 dB), a boost switch that writes 0x0a00 for on, and enums
   that map items to device values, plus an "Other" item that only
   get reports, for values outside the list. Would it make sense to
   move the unit, selector and an optional full name into each control
   entry, and add the new value formats (1 dB volumes, boost, enum)
   as ctypes? Or would you structure it differently?

4. Checks. My helper returns -EIO on a short read or write, before
   it decodes a value or updates the cache. My matrix put also rejects
   values outside -128..+6 dB, and get clamps what it reads back.
   Could the shared code keep these checks?

I don't have a firm view yet on which way is better. If the iD14
fits the table without many special cases, one driver seems clearly
worth it. If it needs a lot of per-device branches, two smaller files
might be easier to read and review. What do you think, now that you
have seen what the iD14 needs?

If we do combine them, the order I imagined is: your four fixes first,
then the rename to Audient, then the generic changes, then the iD14
tables on top as v2 of my series.

In that case, would you prefer to do the rename and the generic part
yourself? The rename would also touch MAINTAINERS; how would you like
to handle review of the iD14 parts? I can write the iD14 parts and
test them on my MkI. I don't have an EVO 4, so would you be able to
test that side? And which base should I work against, sound for-next
once your fixes are in? I'm also not sure how a combined change
should reach Takashi: as one series, or as two with a stated
dependency.

Thanks,
Will
