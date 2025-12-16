Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC08D33A6E0;
	Tue, 16 Dec 2025 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876797; cv=none; b=d29eQmJTna3nQP92zLtRHhT+rm1D4Tbv44EXSzXqN/n0GsaMqKO8MdlSnk5rcdkQzBz8M/H7o37a7oVS35ke3yIPRFJ+EQ1+UzzVRuef0SUyEJPZBFk26rbJv4zgaXvENW7/NHGX9jAVwu6ZjfaI4eKFoNS/2NkLAgMD+rGeFbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876797; c=relaxed/simple;
	bh=YEkJeIhk2M4F9Rr5VG+saCQip1iEXmyqlC3eS+4v8FQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lOW/vNQclBRWoC0cxDdbS1j+flWJEbFkV971B6rqB2rXYA3KA/CIMJaNGpSgNzk8BmJnJ3JArjDqscrvv5PuVQea0Cs4YspijeRCwPnb5eXWDPzkjiq4eKUWwwOni51TKpQ2gy7gy1sBWcPKqeJ1vOh6YCzURneNBCbWftc7DHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2BMyoPZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2BMyoPZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076E0C16AAE;
	Tue, 16 Dec 2025 09:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765876797;
	bh=YEkJeIhk2M4F9Rr5VG+saCQip1iEXmyqlC3eS+4v8FQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F2BMyoPZKHmCh7I8y5WowCPuJZYSow0w1lova+WntQN5MC3axwGN4P8Q3b55KTjnN
	 WS5ZQZ2Mv+Vk9v30lD8Ono+E60b89Bn9BUl299QrvUjAl0VM0D5Dj23Y1J4QYmbLY/
	 jkvOmizzDvYgiXtAkFyPO3e03iUrxte6lsj/baxbU47H/yKHXbWoXrcDTz/HJRCXb0
	 Y1yxxSxfnRCqTUjX8GgaIzGBgaJZVIdbw/xUlA+rwJAc1OU5imnSdodi9FSdGTVl2e
	 iJUQgHq0DdCs4njoAf/rlqbL6nXZLsygliZ0V3cxGTTqnn2dP4zgU9nlDluhMJRRp1
	 pTa9EV/x+I2pQ==
From: Vinod Koul <vkoul@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251215130947.31385-1-peter.ujfalusi@linux.intel.com>
References: <20251215130947.31385-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: add mapping for Avell B.ON (OEM
 rebranded of NUC15)
Message-Id: <176587679566.348344.10609395210156073352.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 14:49:55 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 15 Dec 2025 15:09:47 +0200, Peter Ujfalusi wrote:
> Avell B.ON is an OEM re-branded NUC15 'Bishop County' LAPBC510 and
> LAPBC710.
> 
> 

Applied, thanks!

[1/1] soundwire: dmi-quirks: add mapping for Avell B.ON (OEM rebranded of NUC15)
      commit: 59946373755d71dbd7614ba235e0093159f80b69

Best regards,
-- 
~Vinod


