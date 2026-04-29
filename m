Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D960E1DD9AC;
	Wed, 29 Apr 2026 01:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426746; cv=none; b=Tj/iK+Ld4MZ03J/4bXJ1S+vND8v3HHYpfkiwzCoAgYmzOy8e3K3NukGm1ur1Ud6B6l6fRLTkQ7kmJ+L4m5GzyxrlWkIm6kAbpZPbD62Nd/tfCKjEvFzYupYacuHGwhnqKWB8T5ZbHn364IM/YdRaUSSozJEO63nJPn7zan3BQKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426746; c=relaxed/simple;
	bh=RiYU+SgXWMHrp/bAux/PQa9K09I3u18v1QwXk28gNXY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t45BKw4YzPtlGPxxqAiiF6K9/nHytCXPkDkjNM2OEEbdba97wloC741dTgscrqzSSkGWFWaCAZBCGLc2n1o+/4RS99Kx7cudry7OJ3obJP+hapjQdNlRgXXh9yxE69cop4fBURZUAbTc7J3SUA7jjpkOgt1+lPl9xK92kxgMftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=W6SToAJF; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="W6SToAJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426738;
	bh=1Fe6nYs9JHsL/qqU3dPyTkXSVgm0ocwnWDhLNVSkbzs=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=W6SToAJFC4H135svK3N3tnhybZU9xoSWg88eE9WDYkEz4UZqzAitEAHkRP8pmqR34
	 rcFRePJxjwwEzqSLbeIP7diCiVNnPrND8d52v28T2raeTc2Ti3O1D60mPPTuBjK3Pk
	 IryTrrIGsAzYFbOmFAmuQ9Nprq54sHr8+T8AWETg=
X-QQ-mid: zesmtpgz5t1777426734t39b15ba8
X-QQ-Originating-IP: TPf7klzOlR5kzfZDIyJIWcHEw1Bvxv+z3hDvlJHdUQU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:38:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4341323507646280445
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/7] ASoC: spacemit: bug fixes, refactoring, and K3 SoC
 support
Date: Wed, 29 Apr 2026 09:38:45 +0800
Message-Id: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAQBCF4VfRXNtagyWvIheLwVBoByl5d4vLr
 /5zLhByTAJFcIGjg4WX2SMKA2gGO/ekuPUG1Gh0gpmaYsUoKkVLGOU6S4wBH6+OOj6/o7L6LXs
 9UrO9a7jvB82ZfgJqAAAA
X-Change-ID: 20260427-k3-i2s-52ae21807466
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=1818;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=RiYU+SgXWMHrp/bAux/PQa9K09I3u18v1QwXk28gNXY=;
 b=dytFIX3GzeFkPj8nZ2Ocz2RD8jraZK9X/o93auRjGbFdCfGSTcixRXOrk0Fn6gWjrkeRQdcmU
 rpz3VTbG3zhC7S+WlXOXbzADbMTFLbs8xc1ZGGftBcOYSosKCbspItK
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M+BnQPkxfPxq9fHD2Uj/k2rhAdmpCVGUbfNkm73xD+9ywzqXMFc4nSB4
	rQ4FwWoaz0D7h96H7OzYKbEYgtjaDcqsB0/EQuQhuZT+8LBaZJucM/IS6ncCBAPjzNtmjnO
	6ANPCrPDBD0+ypHq9YOEnDcdglZn6kMLdLEMj/+mBu53dncqp8sOILBi6vgn8kIjuS2EpOx
	+452xEKAAhSIOwoOoder/WOp8r3MTIkZg2LB8U0zYigDNT61cW1QtKkyI7CtV8a1fyjbogJ
	tVM7GFcax7ZqIkl85DqHcncDeu/a/Xt+MmuVmXaP4yN4ZXVtB5cEZ93CcOESyiUgjQJjtOC
	r6ChCU8/azBYvN5hvYis4NVAsdzp7pbKT2BCpaSSoSdRu55/EA5yQxh/KUmLrvhF7jpRdZD
	Ikf1YQU4GTUDqn00QPALekPDMi1f7VhucSk93c09bFx0PUS8f+yY7tucspVoDS3/yRtYhRE
	2AQ9h0f/9PE6XZzfbfkz6tL7ILXujaqhjCu9yAuTs/hUZqnpbyIMiB3lvBWtoXaMVAOLlq7
	TAtmQVG18bhoNsQOpoJO+Rl9bLSe+VkVT4SwnHbyUpjqyucOLWftPE38tCUvDaSoD7k//EN
	phboGAgkr6T+MCT7NTxxrfGuGz7KFpXGF8dXsa8sLIDz/Djwh+H5ArNqeZdYNkzKlmhJ0xW
	0iZ48CDdOqLGqumUaZdGw46eQ1D0WKrq76OoJcusZIkkOG72mDoui2AeKJ5vjS3PQzc6Y+K
	nwjSa6vHbzfjdVtar+G3p592lwYJXujbuV/L+FtHZknSv55D+zAFoLaxcCxM9uZB+6Ncc1l
	P+8B7RQAW9CiM9PB2n/55VeG+ewGAuWZ5drjoLooBr3qx6YvtCPPgrHp/HVTVCyGCsU5anq
	lz6TPN0TW4dyAC3dTm3R0f802iwzxK7rce2VskrIB39CKZxRtcirTQcDGw7eSwwhbtc2y6c
	+0Hjb+0E/aC3b36Gw15brJpJiIf7TMKISqQg6P0vHi/erWoHfCOXxgfGiw/4HsKp7ZLAoFo
	Vttkx0zaYyYqBCAHYyBZQRn6wlwz/Hjv751cpUMH9d0AUVUUJz7eWlCjqVd4Cs3xAfwjsuQ
	nwbW1FBEpE92pgNbPUlb7lqgXwSwN/TWKO2Aln5drcrvKjnCIjW6+I=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

This series fixes bugs and adds K3 SoC support for the SpacemiT I2S
controller driver (sound/soc/spacemit/).

Patches 1-3 are bug fixes and refactoring for the existing K1 I2S driver:
  - Fix RX DMA params not being set when TX is already running
  - Move hw constraints from hw_params to startup where they belong
  - Adjust FIFO trigger threshold to half FIFO size for better DMA
    efficiency

Patches 4-5 add dt-bindings for the spacemit,k3-i2s compatible and the
spacemit,fixed-sample-rate property. The K3 SoC uses the same I2S IP as
K1 but requires additional clocks (sysclk_div, common_sysclk,
common_bclk) that are shared across multiple I2S controllers.

Patches 6-7 add driver support for the fixed-sample-rate constraint and
K3 SoC with additional clocks. When multiple I2S controllers share a
common bclk, they must all use the same sample rate.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (7):
      ASoC: spacemit: fix RX DMA params not set when TX is running
      ASoC: spacemit: move hw constraints from hw_params to startup
      ASoC: spacemit: adjust FIFO trigger threshold to half FIFO size
      ASoC: dt-bindings: add SpacemiT K3 SoC compatible
      ASoC: dt-bindings: add fixed-sample-rate property for SpacemiT K1/K3
      ASoC: spacemit: add fixed-sample-rate constraint support
      ASoC: spacemit: add K3 SoC support with additional clocks

 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml |  39 +++++++-
 sound/soc/spacemit/k1_i2s.c                        | 106 +++++++++++++++++----
 2 files changed, 123 insertions(+), 22 deletions(-)
---
base-commit: 02f694bcc20c664d9f4754229a3be28683c2a3f8
change-id: 20260427-k3-i2s-52ae21807466

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

