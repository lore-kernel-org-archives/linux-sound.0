Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16798437114;
	Wed, 12 Aug 2026 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786536905; cv=none; b=X3nIK8QqdDHhcZ+UwxAHWSsVtTpZoze+rWXpHw+itxSVheZvemfX3KUkUYQ/AAVogZdt+ZpYh8Piapn4KO5+v5t6/urqAauFDOaU9Ld/DFL4I9d4HEuWmAAPraHGA5IpcvaYFUTlqEWcKLOgaCxtpLFmAEWV/4Qce/VHIHdwn9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786536905; c=relaxed/simple;
	bh=6pgC++ZBb467nC7d1OP+Rg5b3LczDPKlCVEz0RZTG7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CfQQ327ve40LjbR2V9dJZvu+uW7nBnLC6J2HGolVrVVaCqTdF6ZplyewmREiEhEs35h77W621QjHIwLMq1nqAq2CbumkBRJgwF5CNrRLzEXHIK93MRKz10lKEULhobR/nAP7p6vkG7qSzsuf6se2rXllWoDoUUkPjIFBCQhqAXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZ0bPla8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZ0bPla8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BCA1F000E9;
	Wed, 12 Aug 2026 12:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786536903;
	bh=M4lHW6Fby9ZDX8+bfMqm+IITLW9w3ugNpQcrYWXX7G8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YZ0bPla89gbRPyzprJ3K1ii8rgyc59uiSLLrld9Hsg5u6fDLKFakkPC4AjS7tPJJw
	 w3yCE1lOaD1xtuth2UzKeBT1f1Yt1ezi1sEpc9rk9rtwXnPsCQt30GXbf03+esk88L
	 j/GydC7yKVU0fuD/qcSN+0XutopZM3o4BeX/Le7Xe+e1K5rpaXmkfF9fT7QV/jHkNM
	 AnK+sdfOOVipfrAS73emlksEJERz7RXlQmc+/oovcX2SooB1DVKsPclXITjjzwCpIn
	 at2qPWTBDA3ML7Z8gXfB5zC//Doe+vkxU+OJ7vXHAd4a+25Zb8x+FomedumPDZbkpu
	 DqeH1UoELbIaQ==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260807121425.1952003-1-ckeepax@opensource.cirrus.com>
References: <20260807121425.1952003-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: Disable ghost Realtek on Asus
 ROG Zephyrus Duo
Message-Id: <178653690154.1182105.15193450460545679080.b4-ty@kernel.org>
Date: Wed, 12 Aug 2026 17:45:01 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 07 Aug 2026 13:14:25 +0100, Charles Keepax wrote:
> The Asus ROG Zephyrus Duo also has a Realtek device in the ACPI that
> doesn't exist in the physical hardware. This confuses the machine
> driver into attempting to create DAI links for the device. Add a
> quirk to remove this device.
> 
> 

Applied, thanks!

[1/1] soundwire: dmi-quirks: Disable ghost Realtek on Asus ROG Zephyrus Duo
      commit: 5b08a3afd2995e5312c4c47ffea9d21b651e8e13

Best regards,
-- 
~Vinod


