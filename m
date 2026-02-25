Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A5F30DEA3;
	Wed, 25 Feb 2026 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772006294; cv=none; b=kI/NrtZwghNNggTX+fsPFg5CduJ81Zal621oJxCvby8FHRQ6gKJRlHqEeU1vGAu9us7BIWlAWMk8ioQeYCmd3Hu+gEy7mmuTBVhtVr+vSahMEDHwpABIBWDdGcobD0I6Rm+97dy5UTqLurt13IplOEc23ryGLdARn6dAPGSqhY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772006294; c=relaxed/simple;
	bh=iswnun89iy/8x+ZHUVT2E+E61hEl/wghJwubLKTE87g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AyNM0gTmR+9Em7VM531W32XcwR28zCSu0ZBqn9Eue2/Ofgoz8iEII9Oxl7AKfsrGBTBupJaKJ+YkPOlarZyE8u600lqT+fc600fPeygAxTZPH0DpuSsyPOVhkhhl0U60+x73Q/ZS/iNTcZX1xaHNt/7lqNbG9jf29GSoPOGTF7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaDlWLqA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaDlWLqA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6C4C19425;
	Wed, 25 Feb 2026 07:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772006294;
	bh=iswnun89iy/8x+ZHUVT2E+E61hEl/wghJwubLKTE87g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LaDlWLqAoHX1zJ2m6slI6uGhmy30F4UW/BtghI6ccKYZccu1H2EpX8SKe0TMs/qxz
	 4o4RDy3zpYlE9v0UtTj45K4Bb5ZboO7JuTtB2sC0iu5xU7LRgoqvMgyREqd9gA2YBO
	 4n6YxQFn9IydxD+sLLaGpeaKhXMf3BX6nupA2oRIVvSKJgAK6LBt0a2MY24Nb1La5F
	 2K+jx6pp43gaU3WTg4zlv/VhPeclUhW01cflwZeWLRAUyCc/phP4Nprj/vuhKt4sfj
	 +cOOUWYpkJFwZPDEteiHOnUoeEousPhzQbQx0bc9IEpupzeeBD8o3gSC7OSusgJr21
	 zaFYs7wIfYMWA==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260223092048.3695135-1-ckeepax@opensource.cirrus.com>
References: <20260223092048.3695135-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: slave: Don't register devices that are
 disabled in ACPI
Message-Id: <177200629192.33527.3353437424878964427.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 13:28:11 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 23 Feb 2026 09:20:48 +0000, Charles Keepax wrote:
> If a piece of hardware is disabled in ACPI it shouldn't be added to the
> bus. Add code to handle this similar to other buses like SPI/I2C.
> 
> 

Applied, thanks!

[1/1] soundwire: slave: Don't register devices that are disabled in ACPI
      commit: de67b4ea168f01dac24e328aab6be0802a5c96f6

Best regards,
-- 
~Vinod


