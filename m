Received: from mail-m155104.qiye.163.com (mail-m155104.qiye.163.com [101.71.155.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF4E367B9F;
	Wed, 22 Jul 2026 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708091; cv=none; b=UmjlWPyG4ofHeJfPz1TIJfGe5/LG1kQCKNGUt75fi+8qeHhAwGiLnQqFwfkTmEObxbe0bYixELHXTMOMVKXaJPooeecYjY0Jf4ZYj1m/JXQquWnzorkO4s7R3G1iLGnRP6nUicx9ZDC4CMqcBiZgONlJbAQvEc4S2x8OtZIrA/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708091; c=relaxed/simple;
	bh=H2jYEbDE6zMb0RGciZdnuLVAPpnxh4KM3390+TUx0sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VKcGVGCUgk8spEi8HXxZvovMWDA3SszxAefkM43iG72oO/tOjZ8L/Nfa0KYtVTVx1vh8NSwaAvnUB6rjsVXVkf0Xjv98NjRiTCT7Fj3ULUl9wro3IGiyz1yKqxgRkoXQ/JfAkwVHTbwCWxosuErMFb/A1L5YrXk9Mug5OessLes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=UUimcXcZ; arc=none smtp.client-ip=101.71.155.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="UUimcXcZ"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 471eb5888;
	Wed, 22 Jul 2026 14:58:56 +0800 (GMT+08:00)
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
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
Date: Wed, 22 Jul 2026 14:58:39 +0800
Message-ID: <20260722065841.2424602-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c293d9c7-bdb7-4303-80c8-404228c434d7@oss.qualcomm.com>
References: <c293d9c7-bdb7-4303-80c8-404228c434d7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f889ecb2109d5kunmcfaa0ab945fac3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTBhCVktNSx1CSEJNGENITVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=UUimcXcZWMPJFdsTTyztDrXVh+0OGkluTZ8/C6r8Q5PSKq++b38V0To/DTj324yrXObI+/umpE2tiLdtf02EOgY6KnAl9cHg7mNRzyAdE0sg+KN/YHaxEPapQsgIoB4/qDw/OjJYDPzLoVEEZ0ryBLsm54X5GIUVg0j562vPsAk=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=sJG7TkJXw80gNmIP7/g1NThayM9xyWHMAaqAHg5lEmo=;
	h=date:mime-version:subject:message-id:from;

On 7/18/26 11:41 AM, Hongyang Zhao wrote:
>> On 7/15/26 4:02 PM, Hongyang Zhao wrote:
>>>> RubikPi 3 uses the AudioReach firmware path for its external audio
>>>> interfaces. The primary MI2S interface connects to an ES8316 codec for
>>>> headset playback and capture, while the quaternary MI2S interface feeds
>>>> the LT9611 HDMI bridge.
>>>
>>> [...]
>>>
>>>> +	vreg_es8316_3v3: regulator-es8316-3v3 {
>>>> +		compatible = "regulator-fixed";
>>>> +
>>>> +		regulator-name = "vreg_es8316_3v3";
>>>> +		regulator-min-microvolt = <3300000>;
>>>> +		regulator-max-microvolt = <3300000>;
>>>> +
>>>> +		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
>>>> +		enable-active-high;
>>>> +
>>>> +		pinctrl-0 = <&es8316_power_on>;
>>>> +		pinctrl-names = "default";
>>>> +
>>>> +		regulator-always-on;
>>>> +		regulator-boot-on;
>>>
>>> Does it need to be always-on? Is it really on at boot time?
>>
>> I think the regulator-always-on constraint is currently required.
>> GPIO117 controls the power switch for the ES8316, but the existing
>> ES8316 binding and driver do not model regulator supplies.
>
> Please fix that first.

Understood. I’ll send a new patch series and first try to address the
ES8316 regulator supply support issue.

Thanks,
Hongyang
