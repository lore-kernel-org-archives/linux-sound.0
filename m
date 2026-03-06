Received: from mail-m3283.qiye.163.com (mail-m3283.qiye.163.com [220.197.32.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41958479;
	Fri,  6 Mar 2026 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789158; cv=none; b=EWp5R7Xq/0LQF35Lj2lnw6V9BTlexOpSQAq2mnPGsfqEE440Tb6SUUQzoCB2/BjViCaDozo427Fm3L9a2bPaJQgG89eTSwCi943UPti3qIx6NG3k8VrAgR8mLbUGVgnpPtmI7E9MRrF8D4YIEM9HCMlxslta5ZYFF+YNHgZ83Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789158; c=relaxed/simple;
	bh=a+ktl+6Z2ANxp+7oVzuLBl0HP4W7cWFJO9d6whe7qmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4w3L2sPpaUDoMluMtUkNEudnMiJOonuF+GxS65drQ2CiXc86JTcDsiA7Lyee+eMTHHhsabfGbozTyeWYqJcpRvx6l3Pd8UcRfj5EHdSwN5L7Zhn3CK6cPm0RmFR0PVfrpJpz4vQPI46ya1cF0kpIlUr+tVdz6y9eunfi232ht4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=LvJ4cei+; arc=none smtp.client-ip=220.197.32.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="LvJ4cei+"
Received: from ROG.. (unknown [119.109.125.5])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35f6f2408;
	Fri, 6 Mar 2026 12:49:39 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: krzk@kernel.org
Cc: andersson@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	drake@endlessm.com,
	hongyang.zhao@thundersoft.com,
	katsuhiro@katsuster.net,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matteomartelli3@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	rosh@debian.org,
	srini@kernel.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
Date: Fri,  6 Mar 2026 12:49:34 +0800
Message-ID: <20260306044934.8025-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d5296247-9d68-4004-a068-1484cb1b9183@kernel.org>
References: <d5296247-9d68-4004-a068-1484cb1b9183@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cc17ad7b909d5kunmafd3db6bd33b36
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGkJNVh5DSR9KHh1KT0tCSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkJVSktCVUpJTlVOWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=LvJ4cei+UzZZnE7DTLBy+W/z3Bj5+2T8TZRDBGJPMsVXlZM39zFNek9fiotrPA3kAsioNBoY9S8MbgMIYKVGKPc+d1hJXxARf0ftTYbqeuHNowoiPNzPDayAiGumghA/hNEN4+tNRbcy7xGRA26XwP+N9Zgjq5ty/GO0aX25xPc=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=leLi0H7EThRKOfSwiKOklp2dVz45SXqTlCpOio5WA6U=;
	h=date:mime-version:subject:message-id:from;

Hi Krzysztof,

Thank you for your review.

> On 05/03/2026 06:47, Hongyang Zhao wrote:
> >  
> >  &apps_rsc {
> > @@ -727,6 +755,23 @@ &gpu_zap_shader {
> >  	firmware-name = "qcom/qcs6490/a660_zap.mbn";
> >  };
> >  
> > +&i2c0 {
> > +	status = "okay";
> > +
> > +	es8316: es8316@11 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).

I will change the node name to es8316: audio-codec@11 { ... };

> 
> > +		compatible = "everest,es8316";
> > +		reg = <0x11>;
> > +		#sound-dai-cells = <0>;
> > +
> > +		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> > +		clock-names = "mclk";
> > +
> > +		interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_BOTH>;
> > +
> > +		everest,jack-detect-inverted;
> > +	};

Thanks,
Hongyang
