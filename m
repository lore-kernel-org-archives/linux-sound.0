Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3223212FAD;
	Wed,  1 Apr 2026 16:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062720; cv=none; b=aCNmVOKwQBBjCfiIjfAGV43YbwJYrNYnnqJgmXcAPoBLFI5fmAo8zW+P0H13YJsxIOWavtT3ev/H8G4KQ7PgSvj73FEqoGuoTUJRp2iz+vswnDVD/XaWwEVODtcCgL0KSMI2M0Mwj0Sr9sXMrGmGTeOBV4Z8GWEIjB3NznXlksg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062720; c=relaxed/simple;
	bh=LRHHCfORmjd6EFTG0oXpuOsygtXl1dFUmNEpIuOzFcA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DfngPct2IcdQHJt7p9KkDQI0CtoDdXzVx/CCTJ17BDx7bctZg++Jbc3kC1yzifTatAbkWfjxP2SaTy76WZRPCNeHMiyBOO7aJPufh6r4I/gQpvABVgcBylPyXY3J7FBshmnN+frLDmytgA7v+wKW/iDghoM59AUnSJk6y4i+9lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaRgGRZH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaRgGRZH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22851C4CEF7;
	Wed,  1 Apr 2026 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775062719;
	bh=LRHHCfORmjd6EFTG0oXpuOsygtXl1dFUmNEpIuOzFcA=;
	h=From:Subject:Date:To:Cc:From;
	b=BaRgGRZHkESsd9AFm82QH217ovNAOhivmNHtrRD/OzWTWiMKXbt/ZzzULVceai1yB
	 Lgpwuna4SUPqPRIoq+szVKd636oRflT4W61fpm7JR1g99szgwV3f6/iwKjPYKeWUsu
	 KXorjLAz5huPU0RzaeiyK9iFiIjlwfZhSfFQiWcaNvGMB8+F4Lsx129H/2QonvGbJ/
	 VmySxHYYLuv2rh2mgim2KD3r42NQQhgRPDie5TAUZa331OsBhY3GtsSNITgd0LumpJ
	 Ii/0bmzFB4+VK9Y6V5RfHbmYC9Pf7sbhaXSYz00kZhYfWPL/6vs+QtkMExE0ufLolU
	 jttcSeJUIovdg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ALSA: compress: Robustness improvements in pointer()
 handling
Date: Wed, 01 Apr 2026 17:57:33 +0100
Message-Id: <20260401-alsa-unconfigured-tstamp-v1-0-694c2cb5f71d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH5OzWkC/yXMQQqDMBBA0avIrDuQRgnSq5QuYjKxIzZKJhFBv
 Ltpu3yL/w8QSkwCj+aARBsLL7HifmvAvW0cCdlXg1baqLZVaGexWKJbYuCxJPKYJdvPiqbvDXn
 VuaA11HxNFHj/rZ+vv6UME7n8/cF5Xmb5vzR8AAAA
X-Change-ID: 20260330-alsa-unconfigured-tstamp-6886ed04cf22
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev-7777e
X-Developer-Signature: v=1; a=openpgp-sha256; l=819; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LRHHCfORmjd6EFTG0oXpuOsygtXl1dFUmNEpIuOzFcA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzU67h8WUfC6X4exHYI8yPY9MJpVFbtnaMgYh7
 FKvfByaO7GJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac1OuwAKCRAk1otyXVSH
 0PlEB/9c1HBbA2LEQI36xa+RDupFUX8y7tfsNPuwMsw4LsWLRs5GiRd8/REazUNHnm2HJ0NaTDC
 zcHPU1UXPFO87hHHUncnRfq5KOLq9O8o2MYI+qJqVExeas6BHg+miOFY8EZkAMpxHSnpBxnrivi
 cvD/njyRNp3VJiCX4h/7SqEX5vtGlNHxzzy//uqBwirKsyDhH2DY09ASZbY4KzpJkw9KWvV3lpZ
 hqyRrabvyZ3/jREj4o3/EY3e93sr8/1ZWmjwSE1NBOOZB+JOJ9oDpPhu4A95PeFCNSZA2D9jocU
 INeC3/Cl9BB9qmK1SNpHANK4tbmXnqKg2lMJwj/DpDJ3XUgw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

While looking at an ASoC driver I happened to notice a divide by zero on
a pointer operation, discussion of which with Péter Ujfalusi identified
several other issues in the handling of pointer operations in the core.
This isn't a comprehensive review, it's just fixing up issues that
happened to be noticed.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      ALSA: compress: Refuse to update timestamps for unconfigured streams
      ALSA: compress: Pay attention if drivers error out retrieving pointers

 sound/core/compress_offload.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)
---
base-commit: 7aaa8047eafd0bd628065b15757d9b48c5f9c07d
change-id: 20260330-alsa-unconfigured-tstamp-6886ed04cf22

Best regards,
--  
Mark Brown <broonie@kernel.org>

