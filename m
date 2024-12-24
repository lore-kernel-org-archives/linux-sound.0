Received: from out28-196.mail.aliyun.com (out28-196.mail.aliyun.com [115.124.28.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758A8190063;
	Tue, 24 Dec 2024 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735038578; cv=none; b=tl1yxhwy/0Alv8Fp01OlbzDC7OzjV1xHbxEI5pvXu7nbKjrGGuMceinFJrwGoxpvTGg5Tc0oagoe722D1KPOpqR0SoilnHn2rf2hEUWtaduxBnhskyi7P/zoPFQlrLIqVfChIt/gNSkTr1KsLvvs9xZH9cTW+U7yrysaHq3HXeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735038578; c=relaxed/simple;
	bh=961d1D19veUZ2eZsHI9UkKM6Jp8StVEfUkIJFS8r+1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IVnfJCeLCYPPZ2oOcoRUPWYYO0N9KcUsWHN94FRAzuPhJc4W+acPCHzYtY0rtIpulJqc5CugFxuOvfEyE6fPh+/MTd/bC2cggpg8LGHhTrHmQx6UWORA5Os0w6hy/Uaz5CSrUE4oCk2y0JeD668UCmQA7GIA06+B1/7xfnApd7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.amG2jAB_1735038557 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 24 Dec 2024 19:09:23 +0800
From: wangweidong.a@awinic.com
To: luca.ceresoli@bootlin.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	herve.codina@bootlin.com,
	ivprusov@salutedevices.com,
	jack.yu@realtek.com,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	lkp@intel.com,
	masahiroy@kernel.org,
	neil.armstrong@linaro.org,
	nuno.sa@analog.com,
	perex@perex.cz,
	quic_pkumpatl@quicinc.com,
	rf@opensource.cirrus.com,
	robh@kernel.org,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	yesanishhere@gmail.com,
	yijiangtao@awinic.com
Subject: Re: [PATCH V3 2/2] ASoC: codecs: Add aw88083 amplifier driver
Date: Tue, 24 Dec 2024 19:09:16 +0800
Message-ID: <20241224110916.373428-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241224105655.271068f8@booty>
References: <20241224105655.271068f8@booty>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 24 Dec 2024 10:56:55 +0100 luca.ceresoli@bootlin.com wrote:
> On Tue, 24 Dec 2024 11:18:23 +0800
> wangweidong.a@awinic.com wrote:

>> From: Weidong Wang <wangweidong.a@awinic.com>
>> 
>> The driver is for amplifiers aw88083 of Awinic Technology
>> Corporation. The AW88083 is an intelligent digital audio
>> amplifier with low noise.
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202412201745.fBpf3Ui5-lkp@intel.com/

> You should not add these two lines. From the kernel test robot report:

>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202412201745.fBpf3Ui5-lkp@intel.com/

> If you think about someone looking at git log in the future, they will
> see the final version of your patch, they will never see v2. So the
> final version (v3, v4, whatever) is not fixing any error as the error in
> v2 will never be applied.

hi Luca,

Thank you very much for your review.
I will remove these two lines in PATCH V4

Best regards
Weidong Wang
