Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27406407590
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568228; cv=none; b=T0VKpet5zJOvzpWaWwXG/9VgHHqlcK3bVAc5N7wXQzg3gnzCj25LwJt40QUQQDn7CWEBOeuHcggRqCWRYlwPRHsAyQ/kRf3U5FjIwhqLJFdSCNliMkn/jogi5+uuEXv8eUSWrwnDXZAP90xwORo0g9N325RMHV9JH8DQBuMh2Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568228; c=relaxed/simple;
	bh=lX1A4sGwuLONuEdkHIPmWB+n2P5P+Xp2SaICYsDRVoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JL8colhla16gJOyaMOEquh1QnIWOovRLk5gOtpiWvpoY3Oqkpq96s7zigJeIhJtg1Ntfta7NxoD4gz+pXmvBkrpeys8jbhXqCGu8BltyE18h+xretKzvvTY4cIr6r/VvVIpI9br3wUDpPzu9p++QtuJUH2lsyXYMQjbdY71m8BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGbTU3Kw; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGbTU3Kw"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so5432086e87.0
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 03:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787568225; x=1788173025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yh2KzM96PstOgTX/SZxWKWtNnqrnIUPDsBxkmx4a0Og=;
        b=cGbTU3Kw7TYeeu1TSGPzbHhoQ8dsUUdakhyYxgbMa71rS2qrnmgTCHSwKdzl2zEPI/
         QqrFjbCb8beLV8ss+T8+0GTMDn5U5cB64HL+eH+kE0FeIB309rKH/sXGy4p+lMa0Bj3Y
         85bxr4HL0O5VS1WoFf7kbQ5nl1Y3LKkgv1d3DUPZQzO3XarRQZA4WmshTP2Zcmkxx9P+
         n6MN3s16CJleVcrfOK9jl7Mt3TBrgNZOrexnNpsnx7I0fZJGx+LI8Byi+14sP+ioU/a8
         ZCEkXZmMh/ZIT8/goorZ0NkeeAD908moKG58OVvRxLqe1CODcQrg5q8nGftTJ3lkFMbK
         IL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787568225; x=1788173025;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yh2KzM96PstOgTX/SZxWKWtNnqrnIUPDsBxkmx4a0Og=;
        b=bFPIdm0uufB1IQXHOEwp9TrltCVtd05fknKNlE9BKgs1QMP2dOZyzt7aNdeP5DQT2i
         yeDyQxE2IBxUisYQf3CMqmk/7MD7AXXL8I4azXCyUZfodjzLTIxbYai2tshTLutgyDeT
         quOtnnWJMJKSDCDC6rqBJr+i7VRM7a0D4UP875PzbibUmZC7IJjaCkBIvN7hLO+FEox2
         JMpAyf94DOzL5Ch1PAV1OMsMciC6qmEd9kxxbzuwJGFBDlukUMPDphNS8d9QXkeUNYag
         7Cft09DTsB4CYhIPqzTPH/tk+XM2/JuhdMH3lFOLAq2zt19cRq9KKOkUpGt6WtT9C6yk
         l1Jw==
X-Forwarded-Encrypted: i=1; AHgh+RpGdVXTxu4b6eHlj0FSnct3kK8mheYZNdvtDfyPitwbm6/k6eNW2K4tEGQqNRDlCdjXbEcsj89pzQ+kOQ==@vger.kernel.org
X-Gm-Message-State: AFuF++llJEHtsUoFv1/7DfHMbAl1DEtZTxm9yA5CvqbWJfg7nZrP/yUg
	SSkyYWBDwRJ92GzWzALe8cwErmDidTy63CFKQ2fa4aDxtrfBxnxltTNw
X-Gm-Gg: AR+sD11PtCBmJDEl6uN1HWC83FPTxWtwRbg8VqsuuoARRK1f5W2WUgQgO052QCcCXUw
	Gh4Q6VlDBJt0azUAPscIw8h0tq0xEPC84cHObUbLWQBzLp68L0khgNgF5H5Im6v8Go0WWJnYfEB
	MNt1UBKOMzBWL68/F9NtjRJGhITLdcpDgB+nOfEhv4OzZTQexhAVicTitlkMCKVvvyKOlXXOqNU
	y4ptcoyby3QKiidZYl/uIkE1tZqBtBESH64Ym6zs/YUZGhQuOnVYpFH3YuIft5wtYqPHFF5NmXU
	cxDzBSYPK/hYs0eRQJEwFiBm0R8T3UaR+5zcbmZ9fgVYMGeTmmdsRBrdC1F6ue0j+ld6L0jyjOq
	w82LrjkXHsnju0X9q/6rPwfWAZxsvUGqqQOKFlhcKePRJ574QuZJEX+4Dl8QewKcUOSKiWBUC+z
	w7FxUUN0Fen6icnVya3nJAxkacXeZjOBdkMlYmJBIUYf4l9cQOmWXToYy1BXVecShSjAK8/FONs
	Hp7sU+2mq2f5W5YSBOhsttMrMV1Ecgt8A==
X-Received: by 2002:a05:6512:10c9:b0:5aa:6981:333 with SMTP id 2adb3069b0e04-5b47d4fce19mr7607856e87.16.1787568224784;
        Mon, 24 Aug 2026 03:43:44 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48ce06960sm1650574e87.55.2026.08.24.03.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:43:44 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: tas2783-sdw: do not cache read-only
 Controls
Date: Mon, 24 Aug 2026 13:40:00 +0300
Message-ID: <20260824104000.7412-1-andrey.golovko@gmail.com>
In-Reply-To: <aoQU0+ECDXwU/k3S@opensource.cirrus.com>
References: <20260814094000.22118-1-andrey.golovko@gmail.com>
 <20260814094000.22118-3-andrey.golovko@gmail.com>
 <e3103067-f8ea-44a8-b430-4abb61e45d6e@sirena.org.uk>
 <20260815112500.4362-1-andrey.golovko@gmail.com>
 <aoQU0+ECDXwU/k3S@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Aug 18, 2026 at 09:16:19AM +0100, Charles Keepax wrote:

> One thing that is worth noting, is that sometimes in SDCA values
> are DisCo constants, these are registers where the value is just
> hard coded in the ACPI and typically not implemented in the
> hardware. Generally, these are implemented as non-read/non-write
> registers with an entry in the default array. This allows the
> constant value to be read through the regmap, and driver code
> generally doesn't need to care that the register is fictional.

Thank you - that sent me to the ACPI, and what is there says something
about the whole read-only list rather than only those two Controls.

The Function is described in DisCo on this machine, in some detail: both
amplifiers carry an identical Function node with 27 Entities and their
Controls.  The driver ignores all of it and works from its own tables,
so the two descriptions can be compared.  They disagree, and they
disagree in a way that lines up with what the peripheral answers.

tas2783_read_only_control() names 33 Controls.  DisCo declares seven of
them: the Latency of FU21, the Clock Valid of CS21, CS25, CS26 and CS28,
the Actual Power State of PDE23 and the Protection Status of SAPU29.
For eighteen the Entity is described but the Control is not - that is
every remaining Latency, and the XU_ID and XU_Version of XU22.  The last
eight belong to six Entities that do not appear in DisCo at all: CS24,
OT24, OT127, CS127, MFPU21 and MFPU26.

The three of those I have read off the bus agree with the description.
PDE23 Actual PS answers 0x0 and SAPU29 Protection Status 0x3 on both
amplifiers, both declared.  XU22 XU_ID answers COMMAND_IGNORED, powered
or not, and is not declared.  (XU22 0x12 answers COMMAND_IGNORED too and
is declared, so the correspondence is not perfect, but for the read-only
list it holds so far.)

So of the 21 Latency Controls in that list, DisCo describes exactly one:
FU21 0x10.  Which is one of the two I wrote to you about, the ones
tas2783_sdca_mbq_size() has no case for and which are therefore
unreachable through the regmap.  The single Latency the platform
actually describes is the one the driver cannot read, while twenty
Latencies that nothing describes are declared four bytes wide and
answered from a 0x0 placeholder in the cache.

That reads to me as two separate things rather than one, and the DSDT
settles the first.  FU21 0x10 is declared with access mode 0x05 - DC,
your DisCo constant - and mipi-sdca-control-dc-value 0x0.  So it is
exactly the case you described: fictional in the hardware, constant in
the ACPI, and it wants a default-array entry with no readable or
writeable case rather than a size case.  The other twenty Latencies have
no DisCo entry at all to be constants of.

Reading the access modes for the whole Function turned up the rest of
the disagreement, which runs in both directions.  Of the seven Controls
the driver's read-only list and DisCo have in common, six are declared
RO - the four Clock Valids, PDE23 Actual PS, SAPU29 Protection Status -
and the seventh is that DC.  Meanwhile DisCo marks as DC or RO several
Controls the driver treats as ordinary writable registers:

  XU22 0x09 and 0x0a  DC, dc-value 0x0   (the two Selectors SDCA does
                                          not define - so they are
                                          constants, not registers)
  UDMPU23 0x10        DC, dc-value 0x1   (driver default says 0x0)
  SAPU29 0x10         RO                 (Protection Mode)
  XU22 0x15           RO
  IT21 and IT26 0x10 and 0x11, IT28 0x11, OT25 and OT28 0x11,
  FU127 0x01, 0x04 and 0x05, MU26 0x01      all DC

None of that is reachable from the read-only series as posted, and I am
not proposing to chase it there.  But it does mean the list 2/2 acts on
was assembled independently of what the platform says, and agrees with
it in six places out of thirty-three.

So for the series I would rather narrow than guess: keep 2/2 for the six
Controls DisCo declares RO, which are also the ones I have measured
answering real values off the bus, and leave everything else - the
constants, the phantom Latencies, the writable-but-RO ones - to TI,
whose mail goes out today.  FU21 0x10 would then be a separate small
patch giving it the DC treatment, once TI confirm the driver should
follow this platform's description.

Would you rather review that, or have me hold 2/2 entirely until TI
answer and send only 1/2, which stands on its own?

Andrey
