Received: from mail-m15592.qiye.163.com (mail-m15592.qiye.163.com [101.71.155.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81EF414A1D
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 03:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232184; cv=none; b=uZ5GoavU0/Xa+ASsKg4KOGJStF7/6xTm9sv5oHshawf+S56M/+PbtKMS5ih+CoThcquXwXauM+h9nmi2SFYXFwn+4ibUEGeD7tj291nhQ6ROzGa1DTPp9/FHnCC6Rtj74Zmk8sNCmE25ydyD3PtqPBgNuVqROyyPd5YnOWY5Nwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232184; c=relaxed/simple;
	bh=7n2O+7QelLEae7aaWAy4EeaR8rFUj/g2afX6L24hJGo=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=WRpETiP1t6s5G5Hc4hRPA0Pm1WiDau/rCTC/Wa81uNITRLjVGAM7idq8dL11yqpe0OGC9f1bxM7mXMXuRJtScaefpRKfmd/sqtSCNrKE0TYUp5r9wIgU/XZ89cnNG1j+P+5Y22Yu9B8BNyv8BHQAQkzUPdxrqXY2QPRYpt+S1+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=IA+hUByQ; arc=none smtp.client-ip=101.71.155.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="IA+hUByQ"
Received: from Wangqianghua (unknown [182.148.168.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c0a5ddcd;
	Tue, 1 Sep 2026 10:54:10 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: "'Mark Brown'" <broonie@kernel.org>
Cc: <linux-sound@vger.kernel.org>,
	"'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.dev>,
	"'Bard Liao'" <yung-chuan.liao@linux.intel.com>,
	"'Liam Girdwood'" <liam.r.girdwood@linux.intel.com>,
	"'Peter Ujfalusi'" <peter.ujfalusi@linux.intel.com>,
	"'Kai Vehmanen'" <kai.vehmanen@linux.intel.com>,
	"'Cezary Rojewski'" <cezary.rojewski@intel.com>,
	"'Charles Keepax'" <ckeepax@opensource.cirrus.com>,
	"'bo liu'" <bo.liu@senarytech.com>
References: <cover.1787017592.git.qianghua.wang@senarytech.com> <c3eee22d-2337-408e-bdcf-cd93980a8ade@sirena.org.uk>
In-Reply-To: <c3eee22d-2337-408e-bdcf-cd93980a8ade@sirena.org.uk>
Subject: Reply  [PATCH v4 0/3] ASoC: add Senary SN624x SoundWire SDCA support
Date: Tue, 1 Sep 2026 10:54:10 +0800
Message-ID: <001c01dd39bd$2a46d430$7ed47c90$@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad05vSLXckZBrCguQ6+uvPel5Xjclg==
Content-Language: zh-cn
X-HM-Tid: 0aa05ae3724009d8kunmba406b034b0b0e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaH0xCVkxLSRoZHkJLTEgYH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpNQ1VJSExZV1kWGg8SFR0UWUFZT0tIVU
	JCSU5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=IA+hUByQWDmCOYSGEUC/3N7CBw6AuQvfxJFhieeuj/7+y75m6A+Khw/mVfurYOufEn+zvCd/1Ytcx9fq79yPp1Xd5dIyK+r07iIJgx6D0k07Fz5RhJdrl2HwmqHAxcpSZEiS10+jb5GdYiWaHNf0ujRa77o8e3Tgy4q1LPiqmas=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=Z0xR175Vg/Rzjvel6BZWFa9OMLyvTH4J79cpKbI2H/g=;
	h=date:mime-version:subject:message-id:from;

Thanks Mark - v4 was against an older baseline and no longer applies on
current for-next. I'll resend as v5 rebased on current code shortly.

Thanks,
Qianghua Wang
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Re: [PATCH v4 0/3] ASoC: add Senary SN624x SoundWire SDCA support

On Tue, Aug 18, 2026 at 10:08:43AM +0800, Qianghua Wang wrote:
> This series adds SoundWire SDCA support for Senary SN624x 
> multi-function codecs (jack, speaker amp, DMIC) on Intel ARL, LNL, 
> MTL, and PTL.

This doesn't apply against current code, please check and resend.

