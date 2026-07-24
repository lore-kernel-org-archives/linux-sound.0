Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com [162.0.218.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B1C367B6D;
	Fri, 24 Jul 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784920709; cv=none; b=ZXuJCdi40e5bjqxO7VGZpRUAMx4MK8AeZDIf2vB4VIMAa3PYh99cMg7URHVWEHSPdSfRe1e5jk3OW8k2W0Z5zyIA2KJcIMzUtuJwS1E2d7tOrknRdu2bqcQDcfiJzl/kD+fEX8Zx6F6LOUqD+fei/gRrjjdqFDAVXd1/4/SorzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784920709; c=relaxed/simple;
	bh=ixWNwLfVz61mzrBIXIEsXmzlE2Ha3tHFrKL8fyNJVQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fN7s/XNqADd01a2YUy1m20ryWfT2boVkFF4BQ0mp9Kutz03DKFWOjG1JHXfFXAWihdULQhfftWy7jhaqlUcmudxVG9+TX7re6HjJT2LLTUtA/1Z3KfEKit99Rq1RlC06PqyoQGT9C/YgtA4bOT+HHTxl0z8t19boV82FXpidWY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=162.0.218.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com [198.54.118.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4h6Hk30Zb4z2xHQ;
	Fri, 24 Jul 2026 15:14:51 -0400 (EDT)
Received: from mail.privateemail.com (K8S-PROD-WORKER-14 [87.215.145.39])
	by mta-08.privateemail.com (Postfix) with ESMTPA id 4h6HjQ5F22z3hhTR;
	Fri, 24 Jul 2026 15:14:18 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add Qualcomm WCD9378 (Tambora) codec
Date: Fri, 24 Jul 2026 21:14:06 +0200
Message-ID: <20260724191406.7855-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <06aef9a5-7e8e-4262-9b41-a9c43f588da9@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com> <20260723194045.49021-1-jorijnvdgraaf@catcrafts.net> <06aef9a5-7e8e-4262-9b41-a9c43f588da9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Srini,

On Fri, 24 Jul 2026 13:17:06 +0100, Srinivas Kandagatla wrote:
> > Your probe already returns -ENODEV when qcom,compute-mode is absent;
> > v2 of my mobile series will add the mirror check, so neither driver
> > can bind the other's slaves regardless of probe order. If a single
> > owner of the modalias is preferred instead, a small wcd9378-common
> > stub dispatching on the property also works for me — your call.
> [...]
> We need single entry point, if not we will endup with two modalias. Yes
> current RFC driver was only tested for compute.
> I agree we should have a common so that we can leverage some code from
> both modes.

Single entry point it is — that replaces the mirror check I had queued
above. My v2 will add the common stub instead: one sdw_driver owning
the 0x0217/0x0110 ID table, probe dispatching on the DT mode
properties (qcom,compute-mode -> compute, otherwise the mobile TX/RX
paths), with the compute branch returning -ENODEV until your driver
lands. Happy to shape the factoring to whatever slots into your v2
best, and shared code can accumulate in the common module as it shows
up.

> That is expected on WCD codecs. only TX has CSR registers space.
> RX can not read/write any of the codec register space.
> However the soundwire SCP address space is accessible and expected to
> set data ports for both tx and rx.

Thanks, good to have that confirmed.

> Thanks that would be nice, Also am thinking that we should just have
> qcom,port-mapping for both modes and mark one of the device as
> qcom,control-device which is tx in mobile case. That way we have some
> level of clean bindings that overlap. But I will leave it up to you.

Let's use your shape. The merged file then has a single
qcom,port-mapping (still optional, as the wcd938x mappings are) on both
slave nodes, and qcom,control-device marking the TX slave in the
mobile presentation — the explicit flag takes over the TX/RX
discrimination that the split property names provided in my v1, and it
doubles as dispatch information for the common stub. Compute-only
requirements (#sound-dai-cells on the slave nodes, and whatever else
your v2 needs there) go behind if: qcom,compute-mode. I'll
carry the merged file in my v2 so your v2 can drop patch 7.

> Yes, This is definitely an useful experiment, I was trying something
> similar with both tx and rx side on mobile mode, things got really
> complex because the sdw stream has to be handled by rx codec where as tx
> side will be handled by sdca side.. it was really messy.
> [...]
> I think you should continue to do the mobile mode driver as it was done
> in v1 not think about sdca. Function setup on mobile mode are dynamic
> user can set sys_usage based on usecase so the sdca functions will
> change, this is not static anymore so its not really worth thinking of
> sdca for mobile atm, but we could try to see if we can get some leverage
> from sdca helpers.
>
> Sorry for the noise i hope it was a worth experiment on mobile mode.

No noise at all — it answered the RX-slave question and produced the
coexistence data above, so it paid for itself. Agreed on the
direction: mobile v2 stays the v1 approach, no SDCA; where a class
helper fits the mobile driver internals I'll borrow rather than
reinvent. I'll leave the sdca-mobile branch up, frozen at the RFC
state, for reference.

> Am really Sorry not sure how I missed that.

No worries.

So, concretely: my v2 carries the common entry point, the merged
binding as above, and the driver review items already queued from the
v1 thread; on your side patch 7 goes away and the compute probe hooks
into the stub. I'm spinning v2 next, so the merged binding will be
on the list for your v2 to reference.

Thanks,
Jorijn
