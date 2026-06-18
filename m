Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A82EACF9;
	Thu, 18 Jun 2026 12:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784244; cv=none; b=p603guX9Zlx4tUCHt8ROn8DTJ4OF6BGnroiwZBSqxUGdgV8sG2oMG6t7r6ZkZZ3iu0Xaqe+5iumL5ImRCta0fA89GjKPmr4K+t8lUVkecdikrcQP5QDVJmhPOxRrNe6Lf1b5U9MQktT9Dr/ZYpRkGDzxDA8uUxeojWxI/fXbq1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784244; c=relaxed/simple;
	bh=H+uVBLBjZhVOEmnSdqKVtufUeTA9uOMf1dZkoiK9ZnE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pTL1jl7Imaaw2HgoYwcU9b1b/nxUzI0wgKnw/M+s2VamAs3ReUbKmOopHOq++F89eKLz7Kr7qM1ZHamKsHVb+g6Pz5qpJ5tDaTPhGJ1ApgcMbGzdIrVS3f9bEO3kkAG6ZO3d6koseKhtttTGlGQR7idb5XU+uRbh7YnFYkxN608=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXG/3qgY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXG/3qgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464181F000E9;
	Thu, 18 Jun 2026 12:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781784243;
	bh=KKl8snhSh29MYg8po+6Jx8Ki8jmIiB+11DYp+nyUnD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BXG/3qgYAEsSD1z0+lW+msOu/JdaneopkHJDNUR5xNEPllIqONmyxKy0/IhcZis5A
	 cWCelo1RiZEQDqKGsARVLgTcptPEmJ6dyCwvkkGM9XpFCkFadv4TRjcm2wyVOfm0An
	 1bZ4HbkgHOM2xmyqxQPiG9IDVN0eblYFgXG0JKICiwPD2cWhP+IH1p5a1fMfxgh062
	 Se66kXpJOIv1yaJJhz/S1dG/MY0eNS5DBtKDv+ZOh8e0xwdsE4uGA+MC3uuTcQLRCU
	 AS/oeAUCHk4nLjGFT1zXv4AWCWd8mcLldv4MgZOmDWHnayyzNzjSD8/mnGWFPk1G2u
	 Wp5GoJ9wA1erA==
From: Lee Jones <lee@kernel.org>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com, 
 srini@kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260608102714.2503120-4-ckeepax@opensource.cirrus.com>
References: <20260608102714.2503120-4-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v3 03/10] mfd: cs42l43: Use new SoundWire
 enumeration helper
Message-Id: <178178424001.2084541.8794808457896966561.b4-ty@b4>
Date: Thu, 18 Jun 2026 13:04:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 08 Jun 2026 11:27:07 +0100, Charles Keepax wrote:
> Now the new wait for SoundWire enumeration helper no longer depends on
> unattach_request it is safe to use from probe time. Update the driver
> to use the new core helper.

Applied, thanks!

[03/10] mfd: cs42l43: Use new SoundWire enumeration helper
        commit: bbd4169932ae54394a61ab26905b483967543f5b

--
Lee Jones [李琼斯]

