Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F72328B58;
	Tue, 16 Dec 2025 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876793; cv=none; b=Hy6IV1+uR0eMG/VP9GHiwQIzwIlxOxCjZ6GqJi3SNH1gA1wrUK/GlE8RWyHt0t+OOfIe7grx2+XL5NxV7XCRgzm6wpNFJMkNFsRSGhiVPM/JQROo8lH761nQRXAMwduUiMUpqTLw66+5H9xNaXwjr5Uia6Xcf32eic0YEbS5/us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876793; c=relaxed/simple;
	bh=++qO/Vx9qZoadkNMbau1BfUpbw5hHFX/BbquTYBBHWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D3ciOP0nLnbQzErGCblE53YbGdVE1188j6V2jIYVhgAbnBTm/KCbrDsU9c8zkzPm9Pw4mDX6RKMytxti4rMGDGKfKzw0aizBsJRviaRb06U/NoDznljSAR0TlZMhn3a2vAjfRlpCWOrfkuU50hWaE/cO6LL5FjoAP4HU5up/x4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9dDt6iz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9dDt6iz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2EC5C4CEF1;
	Tue, 16 Dec 2025 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765876793;
	bh=++qO/Vx9qZoadkNMbau1BfUpbw5hHFX/BbquTYBBHWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=O9dDt6izzMk2/t7s/WzMbf2Iz5uakoREe20ACzU77KPk3h19Qlx53RlIeQ2K7uNwM
	 jVF4PpQgscHxOrkdkSo7sE0dYPM0xY9nwP0EsLinSoFaEHHugBNJZ9SCfAAH9g1Pkg
	 MpiRS1xT1CEqiYdDZY32REUQaP5XxK45/Qrdb4bE/3ZPc9fIY/TXwYdbVRlQEwt2JK
	 Q5l4bmNQ7f469JAunXJqWONGKUBujAZVU9PSAVgdhhuk4uleoTjTbnpyoaGsiMNhPK
	 re3sfnrnH7JvwqaBeRY14ItWTmT3rmPYAGjK5Rvy3CVETORrFj5RNKKXg3uNMrq0X8
	 9g1FDUTEX+8dg==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251215151729.3911077-1-ckeepax@opensource.cirrus.com>
References: <20251215151729.3911077-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH RESEND] soundwire: intel_auxdevice: add cs42l45 codec
 to wake_capable_list
Message-Id: <176587679049.348344.6761659696744335898.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 14:49:50 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 15 Dec 2025 15:17:29 +0000, Charles Keepax wrote:
> Add cs42l45 to the wake_capable_list because it can generate jack events
> whilst the bus is stopped.
> 
> 

Applied, thanks!

[1/1] soundwire: intel_auxdevice: add cs42l45 codec to wake_capable_list
      commit: f87e5575a6bd1925cd55f500b61b661724372e5f

Best regards,
-- 
~Vinod


