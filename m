Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B367C391507
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 07:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784185931; cv=none; b=qS+8ESxzPfRQ2X6QZqKq/AskHbLhoJBbl77977xnacLBXg9pxzREm+RilRBFqCmd32MDegMcVkeUP4qQp2ICMqyYSECoRQusDG44h8hnSseR65TQzdIh7Niwe2L1yTghv/HiBE2LzvTjEsE8vOwS4pqYu2BN+qDzhpnB5Sy/CCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784185931; c=relaxed/simple;
	bh=gDVp5x5v6Kzz18aOg5Cccd8s0yhnHfFO/YAynbNOcKY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fQYW5lB/OJKRaO87MC4cDxcc9LZ+1uxTM8POLBnUrc7fBhP1i/3c0OZsBdqSN7UHCF7Fi6LjPOhuyw+uGlZnVD4UeSOeHV5FqJiLt2TaMBcdIkQI9wNzPgm0bNPiJaEsy+B+HURVDa7479wUHujBSEmoJNTQ7I1NEM6jGndSHxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lx9Y6aYO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lx9Y6aYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694531F00A3A;
	Thu, 16 Jul 2026 07:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784185918;
	bh=3pGIIIanrVZoHKnDxA843Vwzq+ue94v3CBOwSPq2nPM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Lx9Y6aYO8CwW1CgPNT2qSdSfUiGH66V7ObJZxazQVvpxk+qtaTTEbDBlu8vkm/w2i
	 tqkH/5iNsrNeaXvhTN7JjAzW1ldrdtg3Pls6bv2YrIL80z0doAHaLUr28ryR3MehWn
	 fOUCYA9T11XfEniApQJ/MA01DKyTmlA48qjunMwu1xDco4oU5cgW7+oZ8qN/EQWC9X
	 t3yr43CsNaznOLmfb13SvdR+7WuTKzx0NPi8m6FuoFdDiH0bC80Ia8HSvq5YBW0BOj
	 JHEZqGG22aCxnNy7FpEXkdkLJkDQNBUnHYPioStvwqF/gr8XMJWpxSzaAlKSlbkfsC
	 MK7L5YCswbSTw==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260715030719.757781-1-rdunlap@infradead.org>
References: <20260715030719.757781-1-rdunlap@infradead.org>
Subject: Re: [PATCH] soundwire: bus.h: repair kernel-doc comments
Message-Id: <178418591705.1023378.11403611524879955265.b4-ty@kernel.org>
Date: Thu, 16 Jul 2026 12:41:57 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 14 Jul 2026 20:07:19 -0700, Randy Dunlap wrote:
> Use the correct struct names (i.e., correct typos).
> Use the struct keyword for structs as required.
> 
> Prevents 5 warnings:
> 
> Warning: drivers/soundwire/bus.h:86 expecting prototype for struct
>   sdw_btp_section. Prototype was for struct sdw_bpt_section instead
> Warning: drivers/soundwire/bus.h:100 expecting prototype for struct
>   sdw_btp_msg. Prototype was for struct sdw_bpt_msg instead
> Warning: drivers/soundwire/bus.h:125 cannot understand function prototype:
>   'struct sdw_port_runtime'
> Warning: drivers/soundwire/bus.h:144 cannot understand function prototype:
>   'struct sdw_slave_runtime'
> Warning: drivers/soundwire/bus.h:165 cannot understand function prototype:
>   'struct sdw_master_runtime'
> 
> [...]

Applied, thanks!

[1/1] soundwire: bus.h: repair kernel-doc comments
      commit: 6409292ab5f7d1a60a6f8948bd6dcd8633c36dfe

Best regards,
-- 
~Vinod


