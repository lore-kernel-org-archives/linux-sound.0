Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30824C9DF1
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 15:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348942; cv=pass; b=n6WeVAkeZt3qXxPUCUIyU5M9bxDz8Dg164Wkq4mK07sy1uQcJXm52M3md6RhUA01dBTdYKglX/LToqDYtYFRaeTTLm3uIleMpJ+V8EVVUzFLPOxpCQIVR2RHRuT7oapTw8e0bKo9JHk6FOvgODmbpyUZbgEafWx/smEpbYXeB/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348942; c=relaxed/simple;
	bh=vyFX1j7DijCsAY/7MwwO4APwu9RE+BzPBT/c1Ev0muQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYPG8p7kIYeIIS4QJAIBAdRtS8UeBaG3/cCWGqwziwA0fbzXQsb9cZJA5BA10DvnGNJtDLv3K0RsdHnw48vWgeCC0jXmeStk/8HVBd6JoGN6yEaJerqXniz3xRLR/mMyQ+qLEgKmpN9LUXpp06Tr+hlER8KiElfmB25NpHTE5mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qg0czSA4; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qg0czSA4"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-7f4f0c89e33so567911a34.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 08:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790348924; cv=none;
        d=google.com; s=arc-20260327;
        b=LggX06tCBc4ZVAgXQRmHl+0dFQchPAYTSoMT7WGV1xX032sS2qClzN/m7yTM4ysm4i
         cGLciksNyyFR+eJ3xNeV834iR9yj6JvhBfea1ruNCJwxgRxmxZx24CnJG2fY1VYVA21V
         xE8JRtVoWAEDPYzX93/GNVMWHbIXO689VQTUXR+oVs59qs6Rc9MDjLsr297SuaOTEOm6
         g1u9CbznwK3Cqs/wxyQu6FX4gdk/NN09GxWw4oR/QjzmkTeaM7AiRnEOJ0xcok5ojQ3j
         DZ8ftgc7FaIF35lO+AuznfgphobN9XEQoCSsUGZkpvCBFo2+zuS4m0mNX8DjPJ1RuhjW
         K99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=prht4RxpGxyY8/QaNwQuwo5UuI4a9fItRhn2JZ3BbMM=;
        fh=B2ItZj7flcZZDDT38I3IiPHWCKH2r0VwK4qBPir1oIQ=;
        b=a+AInR23LvospG2ePGXmforoM2Z0HEpbdgK7aiUsG6jyUVUE5coCl72aX6QkSLdM4S
         QubpFF2ZJSHeq8Rr5CTM0/MYVluD2DPgki9WknrEEU3TOvbgLBoGJYo42+HTzEYVvHYD
         WwMII6VDpdnlXHiIboO1tZB/vHLXHnTKs9G1ERyRZ5oZZd6syOlx7tasAlbb9F3kNdVr
         lq1KVxH3HYolG0Q+tkXt9kq3xYzR65R40xmf5iifZVgRxHVSUEz1rZ9q9CgFagrAiJiu
         QV4WXNdGD9crvk++CaoW521Q44d3fnxI2TUvFDcZ+4+c5RSwj6FQC/cXCHvnCnpE5SLy
         ehow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790348924; x=1790953724; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=prht4RxpGxyY8/QaNwQuwo5UuI4a9fItRhn2JZ3BbMM=;
        b=Qg0czSA4qQVCK8LYsSi33+ottUBTR+ngsyyjD7hs5GP6jAeSQKvHzpgXoYpn9k65ma
         WFeqxqcafTRVWLd6Y4ybFeRM7bxsr4E8NazixiR1YFcTU0u6MVXmamw+npufv7n/VMhN
         PWbv3Cc6pFJ1UN8WQFva5wKrKVpyTdU1VHJjcAtdq9/ponunasIzxGcdg5pXZLL1oNeX
         gC036mSyGdSwQA2pjSLcL1jmyZ4YtDRaSqzZvqFXgLWOfBUOUJrJcqNlbxy5JbAgSaz2
         /PIS3uJVFPqzp9DZNzS5fB9a8K649yiiGqFvQV0U8X4dVHzvWor6h1tskTe4Nu2djKaz
         yarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348924; x=1790953724;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=prht4RxpGxyY8/QaNwQuwo5UuI4a9fItRhn2JZ3BbMM=;
        b=AOX1x4SZnT4RHoM+Grs5TnJNc/c0WCCPtwbaWQQz6sPVfQU9ztsPHWfp1mWP+X+onZ
         16kdI9EyyjeQoqUzrdAN5abe6FnPy/++jEcr3WtaTMxFqBB1JDTTiYUo5FegTi6keshN
         WMFSRwU/4bXRpxLsib7u6rLJGy/5OPwk/69xOcgmBpQnCh6XZc8m+pvLqL72iQFbOp0i
         8BhO8MRRKjV4Ec0McpLjki4CC0dTkArbcldJTgsERYpdqVx6QMhPxTYR/98gF6LxyorL
         t83Hg8rJFYV9E2T5nEEl25wHdeDtLR2GNXTCAzMxz4x+qlJALQJSgeqb41oNm+5AGbpO
         WiiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOBf0I0COxOeOQDhXPgn4B+vJVXy7oG9UD9+CavqyO/IK9lBw7pZktlaXM5zNwZBY4LANQP+t4AB+hDg==@vger.kernel.org
X-Gm-Message-State: AFuF++llS/9FUo7lxheC9K64VPCjJgcbRFqU29+DdPLfRfxIcol2vMz2
	2f9TxdQoekElyKUQEQ+hrxpzNq8cR7aT5UIrm+csi7RfFCMDKZ18HS+ODld50irvwtqBm5qRdGo
	u10ZqS8RPMBuLlwhWQYlwKfIxLeaxv/Q=
X-Gm-Gg: AYBFou2MxYrzRcyPc/N157yp6UoOaOcDeRLsEC4KjcYTP2oLdUX0Z3laRm87R10iI8L
	X5HVeR+izIL3IrUFOxbz66kE2gEOPp/l5HuruxEGiDhPhpujOY3kUTcx8Y5y7Huv4iklihYeRxR
	LkMVU6VIP/E3sWhV9hheJPJpcyYcuOPaTpzcSXhEFR/nvHSUze4j+sU+0HXj4YS36v8kambFZJy
	sEaC6nqfKE8cNsxRod2AkU8HmS3WrVGdxGWa53DME3Lj/wFzwJA1twkBxNi2Y2IdETQfIUDTq4w
	bbRZYAXr0KcW/Kb0vCkC/1KmyNjWkIslAj3zI/p4D7klGBho+LBb2pfUFm6lZze+xc93eNs2r5L
	dEtP73d2silLvpeGmPnq1MrJthIAcKqGhbw==
X-Received: by 2002:a05:6830:620e:b0:7f4:bae7:b00d with SMTP id
 46e09a7af769-8177dac244amr8034887a34.0.1790348923768; Fri, 25 Sep 2026
 08:08:43 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 08:08:42 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 08:08:42 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <SJ2PR11MB842437F022D1F62A2A527297FF802@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260925003030.1077471-1-mauriziocasciano7@gmail.com>
 <20260925003030.1077471-3-mauriziocasciano7@gmail.com> <SJ2PR11MB842437F022D1F62A2A527297FF802@SJ2PR11MB8424.namprd11.prod.outlook.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Fri, 25 Sep 2026 08:08:42 -0700
X-Gm-Features: AclHuK9PJSU9kqM48lGRC5SrS8qiO6GBOeVe8qPls3Qsq3dJ2is1CRYMGDcmEyk
Message-ID: <CAO7O_xg2qGhetLSuks52oVvcH=bruC5Nr5LQz2uAscBHQxPNNQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
To: bard.liao@intel.com, broonie@kernel.org, linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, perex@perex.cz, 
	tiwai@suse.com, jekhor@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bard,

The SOF topology PR was opened earlier here:

https://github.com/thesofproject/sof/pull/11129

It is assigned to the v2.15 milestone. I have now updated it for the
pending review comments, rebased it onto stable-v2.15, and resolved
the reported conflicts. GitHub currently reports it cleanly mergeable;
a fresh maintainer review and the external-contributor CI
authorization remain pending.

With Best Regards,
Maurizio Casciano

On Fri, 25 Sep 2026 14:05:57 +0000, "Liao, Bard" <bard.liao@intel.com> wrote:
> > -----Original Message-----
> > From: Maurizio Casciano <mauriziocasciano7@gmail.com>
> > Sent: Friday, September 25, 2026 8:31 AM
> > To: Mark Brown <broonie@kernel.org>; linux-sound@vger.kernel.org
> > Cc: Rojewski, Cezary <cezary.rojewski@intel.com>; Liam Girdwood
> > <liam.r.girdwood@linux.intel.com>; Peter Ujfalusi
> > <peter.ujfalusi@linux.intel.com>; Yung-Chuan Liao <yung-
> > chuan.liao@linux.intel.com>; Kai Vehmanen <kai.vehmanen@linux.intel.com>;
> > Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>; Jaroslav Kysela
> > <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Yauhen Kharuzhy
> > <jekhor@gmail.com>; linux-kernel@vger.kernel.org; Maurizio Casciano
> > <mauriziocasciano7@gmail.com>
> > Subject: [PATCH v8 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
> >
> > The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
> > 10EC5677. Add a Cherry Trail machine-table entry that supplies the legacy
> > SST firmware and board names and the SOF topology name.
> >
> > The Intel DSP configuration selects one firmware path at probe time. SST
> > loads intel/fw_sst_22a8.bin and uses the cht_rt5677 board name; SOF loads
> > sof-cht-rt5677.tplg through the standard firmware search path. The same
> > kernel and machine entry were boot-tested with both paths on a YB1-X91L.
> >
> > The SOF topology sources are maintained and distributed separately by the
> > SOF project.
>
> Please submit the topology PR on https://github.com/thesofproject/sof,
> too. Otherwise, there will be no topology available for the SOF.
>
> >
> > Assisted-by: LLM
> > Co-developed-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> > ---
> >  sound/soc/intel/common/soc-acpi-intel-cht-match.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
