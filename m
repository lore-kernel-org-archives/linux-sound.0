Received: from mail-m49196.qiye.163.com (mail-m49196.qiye.163.com [45.254.49.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2EF3321C2
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 02:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786586670; cv=none; b=dGdAtKn5no8v6yZxfsrtxbstl5yvJMod+Y/ouApzTQo/0HusIUSNAo17/ta8BQIXqcM8DO3HySACxgKOBoSz9Kixy0xfodSNBnkifcETB3GKojhb/d9ZtGf5b9xtn9jB+l3MXIastZ9/RQnbPp6hFbPsTeNaMGPXj+3uv415a1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786586670; c=relaxed/simple;
	bh=7rY5Ms/tjRfAGITrkhpqw/adz4mgCnJltQzdRJzx/RM=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=RRVQkXSijNNWkSZuDN41HQtNCBxh5WMB3jytXE6Pl3AKa2V3VZi6nXgCmGb3ntPu5u4hFCagkQIFi2I9KBNClUbKaIhH/wByaz8yY6PzQE5eCBEio00UfaSjABkM3hhRZe/GtSIXYV6LL1w9ha6fdL4TQR2JIq3yn241Mgpjr9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=ZNuUhpPE; arc=none smtp.client-ip=45.254.49.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="ZNuUhpPE"
Received: from Wangqianghua (unknown [182.148.129.247])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49cb49a21;
	Thu, 13 Aug 2026 09:59:12 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: "'Mark Brown'" <broonie@kernel.org>
Cc: <linux-sound@vger.kernel.org>,
	<pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>,
	<liam.r.girdwood@linux.intel.com>,
	<peter.ujfalusi@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>,
	<cezary.rojewski@intel.com>,
	<bo.liu@senarytech.com>
References: <cover.1786511177.git.qianghua.wang@senarytech.com> <bcd3758c-c7a5-4387-9a35-c14a572a8eb8@sirena.org.uk>
In-Reply-To: <bcd3758c-c7a5-4387-9a35-c14a572a8eb8@sirena.org.uk>
Subject: [PATCH 0/3] ASoC: add Senary SN624x SoundWire SDCA support
Date: Thu, 13 Aug 2026 09:59:10 +0800
Message-ID: <005301dd2ac7$56d2d8a0$047889e0$@senarytech.com>
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
Thread-Index: AQFzE36xPgsAUv4/OUonqm2N+dVPbgGp1RrJt2IYe1A=
Content-Language: zh-cn
X-HM-Tid: 0a9ff8d84bea09d8kunmb3ba2bb147585c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQhkfVh5PSU9MGksdGUJPSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpJQlVJT0xZV1kWGg8SFR0UWUFZT0tIVU
	JCSU5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZNuUhpPEXyk/DfqFyeX7Aoxv7w3XfrytEiHKO7JSRYZ37lM/mZ1jco50x4lIhMUeFnYQBhvO3XBu/75wAKxlWxNqZ8bNYQDwQR47V3zCKsNUvg9RFk+MWgi2WLgG+YWSDJsU30elhG1RQqRBSLTI9aXSys57+SjGgwbXRkWXA04=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=mJQOIqqsteuz1YRr2aSsiHiIOb4yyWWaW06xnGeW3+E=;
	h=date:mime-version:subject:message-id:from;

Hi Mark Brown:
	My v1 was based on tiwai/sound.git commit f37c5691315d ("Merge
branch 'for-next'", 2026-08-10).
	I will rebase onto the latest for-next and resend as v2.
Best regards
Qianghua Wang
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

On Wed, Aug 12, 2026 at 02:59:41PM +0800, qianghua wang wrote:
> From: "qianghua.wang" <qianghua.wang@senarytech.com>
> 
> This series adds SoundWire SDCA support for Senary SN624x 
> multi-function codecs (jack, speaker amp, DMIC) on Intel Panther Lake.

This doesn't apply against current code, please check and resend.

