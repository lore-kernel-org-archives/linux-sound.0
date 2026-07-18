Received: from mail-m49204.qiye.163.com (mail-m49204.qiye.163.com [45.254.49.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8386E3845CF;
	Sat, 18 Jul 2026 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784368653; cv=none; b=gItpna5L/pn29mexn8CCpS4kflzvsmLUrBOAEnM0L5jCZCk2ZhSAw7jbx9UYYOE3na/f1oTF4OIm1r7Da5e9Go3XdfX0JaiTpHPquG/spUGjan3UJQVtmtd3gqwOz9OKWEZZWjP74bdzVS19/1HRwP88FPmwssGX/53ytvmv4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784368653; c=relaxed/simple;
	bh=T1dnzuCOirb4oTOrTln/mdR/NNhVCCKZTUISOr5SuhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uoO3uzb+mKNZewPqgS0n8TJiCs9nZqNFbJgdHYD1pLteRTCjPHwg9/sdhmpbCrA69Bs+ShXWGdpMhybcxgpyUDSxhMLH/hdcMTvX6pZz+r+ZhJoM7PCpjlWAsVc4WB0UU5LtPxq5ev2CnWBEMZG1KvzjBuy+rDni4c8hA9B7rHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=AYb1THux; arc=none smtp.client-ip=45.254.49.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="AYb1THux"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 46adb6181;
	Sat, 18 Jul 2026 17:41:55 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
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
	mohammad.rafi.shaik@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	perex@perex.cz,
	robh@kernel.org,
	rosh@debian.org,
	srini@kernel.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
Date: Sat, 18 Jul 2026 17:41:47 +0800
Message-ID: <20260718094147.413795-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <43944722-3eeb-4e02-b3a6-6251d5fc78af@oss.qualcomm.com>
References: <43944722-3eeb-4e02-b3a6-6251d5fc78af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f749a938a09d5kunm1186d5631fe997
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGhkYVktIHxlPSkIdGEJMGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=AYb1THux6FDa2eq0vDUqBKvSl8L/MuUxWXZmatNXsx6+r56gWMEc4Xvvfr8J/1S+Yx5oaTOiwrXjPLqA6doAjehqyCM8mMs6vjMFF+NXisuFMLHIdYlYKb8zPvAW5W5u0EPuqOmz8aeotrFGx641O9LRlrpJ47xqAxJmxmDMh6I=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=ZgyFMNAPh8OewPBkUg16pLl+pzENS/cg9LAueq0w9IA=;
	h=date:mime-version:subject:message-id:from;

On 7/15/26 4:02 PM, Hongyang Zhao wrote:
> > RubikPi 3 uses the AudioReach firmware path for its external audio
> > interfaces. The primary MI2S interface connects to an ES8316 codec for
> > headset playback and capture, while the quaternary MI2S interface feeds
> > the LT9611 HDMI bridge.
>
> [...]
>
> > +	vreg_es8316_3v3: regulator-es8316-3v3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "vreg_es8316_3v3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&es8316_power_on>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-always-on;
> > +		regulator-boot-on;
>
> Does it need to be always-on? Is it really on at boot time?

I think the regulator-always-on constraint is currently required.
GPIO117 controls the power switch for the ES8316, but the existing
ES8316 binding and driver do not model regulator supplies.

GPIO117 is not kept asserted before Linux takes over,
so I will drop regulator-boot-on.

>
> [...]
>
> > +	mi2s-playback-dai-link {
>
> mi2s-'c'apture < mi2s-'p'layback

Got it. I will move mi2s-capture-dai-link before mi2s-playback-dai-link
in the next revision.

>
> Konrad

Best regards,
Hongyang
