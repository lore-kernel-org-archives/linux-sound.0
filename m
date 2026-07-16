Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC4F430CDF;
	Thu, 16 Jul 2026 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213185; cv=none; b=f+MO51FqB+JGgyrvpLI8igLe/J61bh8qOikPiCulOjHK0K7n7VO3xchk4f93WipjP6feZtmdoPyNgN2gstkpCzj4FoFfLupMvR0ElJz/BnSCdLV0BzFupnqHah2GbJAiFSpGjo7LlEFJM4n/lk9PQf5/+CpImy8KDqbSm5O//2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213185; c=relaxed/simple;
	bh=CEPF0co2gDoU/qOeK2eYWBpdRWHtmjYaDQgSjflsQTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZYXd6YFYy84py7HBvjqfo2fhLckzP/uk6w5ayUQiLfIijeJKtiCdCd1IJhCrkxN4f+6R/sIylSXIzVI786TCcndO2NFEUEQQxVl/p7pYvDhIHbFg5PycEWayJ/qPN4XE7xxSoSw4hnnpcM2TRBTK9tngfIMVSBVqrRNF8z4iJUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5rhOfrA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5rhOfrA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6471F00A3D;
	Thu, 16 Jul 2026 14:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784213176;
	bh=PIoDrNA5PUO7Z/o7Q3RuYuHeSW9+gp5w+RdpsnYd008=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=m5rhOfrAsnr2ow6C/3bGm+COWQEZ3UbTWmJJOFG+smYGMeWAuXVVXkAGVzJgfPORp
	 TFhqVegrpkV0RqEuIkbGIj24V7oTLVwoqlVAv6RHds9w/nnYUbVMCX1lnSXCC/WWJ7
	 mrYYYqr1HVFGmYJstP13XtCLtIM9O8/Gh3iGrzhCC/plM7WyGp9W7VF75ifZy3Hy+a
	 N3ShaRg5w2+IrE2B4CgxepeI2UcY/z3+tGKG3cY/MqKkW5w+QNPgfQl0VU0cOuvnMo
	 8Dsb4B0bP7nFO0pWBoSyqoapZXFwcuK33nikgMejrAbDjb9YgKYOJa5ios8SivG3L8
	 w3KhraK+1fhWA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, mfd@lists.linux.dev
In-Reply-To: <20260708100914.1298080-1-ckeepax@opensource.cirrus.com>
References: <20260708100914.1298080-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH] mfd: cs42l43: Remove redundant NULL checks on
 SoundWire
Message-Id: <178421317465.1402976.13294596875099339460.b4-ty@b4>
Date: Thu, 16 Jul 2026 15:46:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 08 Jul 2026 11:09:14 +0100, Charles Keepax wrote:
> The SoundWire core helpers now check for NULL on the SoundWire
> peripheral so there is no need to do so locally, remove the
> duplicate checks.

Applied, thanks!

[1/1] mfd: cs42l43: Remove redundant NULL checks on SoundWire
      commit: aa6e7336a9cae7a4c90c74e302fd38f7da93ffc3

--
Lee Jones [李琼斯]

