Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7380273D6D;
	Sun,  3 May 2026 16:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777825999; cv=none; b=EC+KDHncbRLcMKrClsZelwltuz7Wen3fOsq5aP0AihZd7ZTN9ly6FJ1YkvdAgfbGYmtC3zGi/o7LzCGopTHrLIoZxL3tLbPRO7FnN8m1RoaxwnjElQzMlEtfs5FVEoPDi+ECBuEla+tXFkaLd3yhu3W9Y6SyYzdWxJ1bSvGz0DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777825999; c=relaxed/simple;
	bh=VzQHLHNOKSvzn5ZvB8+8cR+JVgAWlrthjjYzqITncDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=afFr1psQ9uCTEOgANGiXERhQnkP2Rd1Cpy/whB5gNBUXHpsaTbtvruqdI4jgFuE1zE7MgpL535T0VA2Vnqp1x1k/D0O+TsDJTmUZC4q1iy2I5s4TEKMDxUQPQvw9rxrzitCffBx6LGe0G6UtpaGHcZ+wqP24rIXniNg+rEWDBxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qskUOs96; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qskUOs96"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696BEC2BCB4;
	Sun,  3 May 2026 16:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777825999;
	bh=VzQHLHNOKSvzn5ZvB8+8cR+JVgAWlrthjjYzqITncDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qskUOs96F5rLO7S4PCyrKuTT3a/OykWnCQEpUIqVXHTc/rVNiezO9JdR/X4wnllLK
	 0DGgyFXziLMqEaavrxmZZerbsj4DEAzTkWjcHxk17G3z4PgJiEvHy466tpV/W6VkKm
	 5vCrcF6DVsWot1o6SdTd6Uh1bQDajZ4EWzt5Asack25bCxF+42kRXUTZ23nZZl2ng2
	 WBIygBkwhHYh5eU8tAmq4NiFoDNkoRnMTs4tQEvyaOhTZuG+uHL0hc7lYc2bkQIofb
	 ChmNsR8Pmxkfb4MkQPYn4BddebDL4korJR9OxRzFYEnteosWOstzGO/t78A4SRd7vt
	 gvxI8nT43+Zhg==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260429153614.741899-1-ckeepax@opensource.cirrus.com>
References: <20260429153614.741899-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2] soundwire: intel_auxdevice: Add cs42l43b to
 wake_capable_list
Message-Id: <177782599705.108644.2260539147538946894.b4-ty@kernel.org>
Date: Sun, 03 May 2026 22:03:17 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 29 Apr 2026 16:36:14 +0100, Charles Keepax wrote:
> Add cs42l43b (both packaging options) to the wake_capable_list
> because it can generate jack events whilst the bus is stopped.
> 
> 

Applied, thanks!

[1/1] soundwire: intel_auxdevice: Add cs42l43b to wake_capable_list
      commit: be6d8daaab654e9b0a8508757534d556d399d0cd

Best regards,
-- 
~Vinod


