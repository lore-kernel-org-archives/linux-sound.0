Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6292346E5E;
	Thu,  2 Jul 2026 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011789; cv=none; b=YCmDjLbG331OyXZPz3ZfEa4G72KalJKs76VKh11j1J9ThAooSdrpQJP5mz/xZ0FUo8vB2YatC52prToPE/dLqInVZ1ihEgo0do/uAZFbKbBBLQnnMxhkhIGYGpryoGKZrmbpMUicg2plWgkMTMDNSA3GZs0+MACnl1Vmzo/jrKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011789; c=relaxed/simple;
	bh=1MKp0TGo5r8hzoznKRa108JTmkdtx5ZA4F2W6/uE1ek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F2JLBVG93y/ZdDCWufIl1jggLkhs0dnaweZszRepaNXfqRFYKvjAZwPXDneWLiLcVAvkax01J22K2ELS7RFUM013ozFU/XKo4pDEd3YrzYhKtSDja5SluT3L5ZdKCZLv/uMNsV9wWJxjxw3eXtdeMsN03B3XZeREb0iAoc8RPG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Apk7bghx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Apk7bghx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2464A1F000E9;
	Thu,  2 Jul 2026 17:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783011788;
	bh=QIKMLKjEy7M4EOea1Il+zitOLAGWvjkq99bc00a38/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Apk7bghxSRddZwxh87pt+kDZQINfzDVlB+ACooRe5dw3pc2OhH0X/fr7g/7Y/52bP
	 p6eS/9obHa/zAtdgkeTPPUNDwrG8sI62zYzLk3DwtE7qZqat6E/cySJbB6AyTR/NZ3
	 trwCshBppqgFcqq8W/fw9Gf0ssT7J8qk99NVzrwDksWT+dVY4BrERBAX4RYY3B4ElG
	 ZP18SxVWFtHbAlyp1seMS0KEXcTqIPWfdshlqqroMt/m7XjwwDVvKyDWrupHON7Zvp
	 GSteFGEIsUNHh0OwELMMj6Y0WIs+vfeHmccrRNOiGg6Lzt+B24Pf+j0lwnzlgs/G/G
	 9u0dkC50lIGAw==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260630081132.3294488-1-ckeepax@opensource.cirrus.com>
References: <20260630081132.3294488-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: Disable ghost Realtek on Asus
 Expertbook
Message-Id: <178301178676.772155.13107645209861795920.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 22:33:06 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 30 Jun 2026 09:11:32 +0100, Charles Keepax wrote:
> The Asus Expertbook B9406CAA also has a Realtek device in the ACPI that
> doesn't exist in the physical hardware. This confuses the machine driver
> into attempting to create DAI links for the device. Add a quirk to
> remove this device.
> 
> 

Applied, thanks!

[1/1] soundwire: dmi-quirks: Disable ghost Realtek on Asus Expertbook
      commit: 90af3209742db61a7f9d7d054a16165818cfc6d8

Best regards,
-- 
~Vinod


