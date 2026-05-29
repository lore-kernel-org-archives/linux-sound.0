Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE10352031;
	Fri, 29 May 2026 06:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036727; cv=none; b=kBsq3omTZvky/lXwq2/UXIBY3Xtm0HTcNCX9TBMsHI4a6ebOLLlDhpjYf19ZcITb8RY6/+ANMuBYeUAlIIG1eGSeUQ6W3TVI0kq01C6IgQVTM8wbJv9GyiJEBbhDgACor+5BbkWGgP1ydo6+VMh1HRF7r8TPX0OAskjlizxxBkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036727; c=relaxed/simple;
	bh=GTXiOdRuVwXhcJo/JCZmLoTKtGHSXmkHpZzoCRWOzug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BrqTalrHUyDCHNpzRAlAzG30heXoaJkofiEGNVrZeYEfsLICi5XeuT3NKhBKTMtMvWEOzDWIgkmTTwmJ+H7eJBOl05Bl5VIX+Gg8WRXtVQUKfASEDGI7T1fwQR6iEG8d1T06ZGC488m6RL9R9W24XtEzf+gZQYlPzULrJCJw2Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDnAcmrF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDnAcmrF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EEB1F00893;
	Fri, 29 May 2026 06:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780036726;
	bh=sSdiTYMkdLay8WjPi92W1Hl0qguAYv5GBhiLaknghlE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fDnAcmrFb6+RE4ZnI02zLs7ENZ5uwelkLnBB1RFP9mwLR1LHDlYgPSXQH009hCRJD
	 rY2LU4K5aFGpKtnMyNb99FcVNjd28i5i7MUezxCTJy8GP+92Yk+q2sYNUtZQjeGR5y
	 uhSXUpSLTUJ7tZ12lNK8UKT1cR4tYYKut1vCfuG1CZ/skxbkhLkkleQws0G0ajtiOe
	 zhMV9wvo3bZgO3/M5iCPJhk8VnXzXk7EEBpZXlbjoMQ1bKHCwmOxKMn/nWvwH0CF6x
	 NnrXOR1d1UOdiKumqMJJuy4nW0FziKbC7mabuIlCtCJdv0Mox+gSlbkGS1UKc62PSd
	 fHI9URNQpOCGQ==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 bard.liao@intel.com
In-Reply-To: <20260520025720.1999367-1-yung-chuan.liao@linux.intel.com>
References: <20260520025720.1999367-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: only handle alert events when the
 peripheral is attached
Message-Id: <178003672334.923776.13182101818086487625.b4-ty@kernel.org>
Date: Fri, 29 May 2026 12:08:43 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 20 May 2026 10:57:20 +0800, Bard Liao wrote:
> It doesn't make sense to handle an alert event when the peripheral is
> not attached. The slave->status could be SDW_SLAVE_ATTACHED or
> SDW_SLAVE_ALERT when it is attached on the bus.
> 
> 

Applied, thanks!

[1/1] soundwire: only handle alert events when the peripheral is attached
      commit: 38cd651ebce7065a81c7e950d9e2ea1572304605

Best regards,
-- 
~Vinod


