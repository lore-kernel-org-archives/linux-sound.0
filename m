Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C3F3EEAE9
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 08:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830919; cv=none; b=gQ2nUPUo3vZp7+6raXCadf5TalnwKL8hfDc8Z8hvNN6203ecHMYwd8jMLZInPjWddtdMhEz/gW8EMEEoJiTP8SKlsJ9DE3Nckwhk4OVqwOsYmWhZF1nzFO37dqKNQHWEdmxWAv77AOBGFVqllqeOoBsMokKpdsOuDTeuL+1hzPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830919; c=relaxed/simple;
	bh=R7uRK61hw3CVR8tJK+r5WwYG+d7nfetP6ZE+BuElEhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LfMUADGKt3QoerYVwJnO+DUewiOVo90QjZjU+NuBoIZ+Aw8AQ/F6G3sCvpygs2T/FPXJ+XkfkswUoXBJQ1BWtw0oBPiidGJtB1ZqfMV04LF0OOGmVvI+sRvJ/daFh3jD9BHrZbC+9Vj/Es27Zq7+BxEEkIjp739tYAAgOyo8r94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=XTXpR6J2; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="XTXpR6J2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785830793;
	bh=6gXVxn6BRjuds9kRjwk4efJbrA6Q136vq3bJ3il3XF0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=XTXpR6J241kfaxM8Qqj5DjAO4b+Qe7X86BXsdrfjolj+rzqEw9xAa5VyFBHGbMoTb
	 iwk7PYxa9/vBd+Ay6MaQhWoKZRxDbEpriHotMm2mQt12FjX5inj3LIh+LmXm/nfcw7
	 JP++ToaocS2o2PoJlj2VDXENnDAK2vPD/UbaRQNQ=
X-QQ-mid: esmtpsz21t1785830791t44ff0d4e
X-QQ-Originating-IP: cxtzIR9mVDfKgL1wExk8Ig2Kk2WishVAHy1amntqvbA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 16:06:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3732353864578006968
EX-QQ-RecipientCnt: 6
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 04 Aug 2026 01:06:24 -0700
Subject: [PATCH] MAINTAINERS: add SpacemiT K1/K3 I2S entry
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-spacemit-k1-k3-i2s-maintainers-v1-1-f19ac47e3a7f@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTNJWwyIVyEshjLiSKikU4wJ4
 e5WXLzFt/nfDspRWOFW7BD5LSqvkGHLAvyDwsQoYzY442pzNRXqSp4XSThbnCsUp7iQhJTHUbE
 hdyEa28G0FnJkjXyXz3nQ9X/rNjzZp18VjuMLKqXo2YIAAAA=
X-Change-ID: 20260803-spacemit-k1-k3-i2s-maintainers-7a24aad9b091
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Yixun Lan <dlan@kernel.org>, 
 linux-sound@vger.kernel.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=R7uRK61hw3CVR8tJK+r5WwYG+d7nfetP6ZE+BuElEhQ=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmFc1sMN8bLx7+7Uh/nVey2vjxFY+2lqO5eTZ+LUnNiS
 2PzpoR2lLIwiHExyIopsnQ/4NlW4BNlWyBQ6Aszh5UJZAgDF6cATETyOsP/YuMVzo3tHF/1ty1R
 a32++35x8gQ+rskc+7d8ZdQ4ve3fAob/BScDTyzmucn5atX78oAEqaC3YnUszwoq0j/lFql8DHz
 FBAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NJ9msQyD6LQVrK/RCeYpM+RUlKK9/3wgJIN0spB06P64FhpraPNXnLtA
	CBXBj8AoL5zSNfRlc9A8J2Dt/XV0SMt7M9TU/g6fZ3ALJF/4qssxJIwzZAbX70n2TiLXXg1
	za0/LIZT357mSpcTwP68StzhFsImuq5lYflY3Io7Vg9IxnvpRlz50552tqSC3Qfgy9wdm/C
	++hoQPe+XVrY0L46eVUXZPSPUG3trwpXYTQ6JXY1+tpketkj8n04daOYNJHj8wJlD8OHATb
	PQEWFQn1YUXCJOwv4I1NS1+4a6PToWWr15bcg0kJiy+qZ6vHmyGIpZAmVXmuG9e7i1prV+K
	/lJyLMRZ9URe5Aq6AUfPcKEvXKBhuso1sT70GDmXLrx2zqNHd7Oq3aN+CfcgAfUVs9bEikK
	ks8ko/Bi9rIcZJ59a+fIuXQ5uP0LAQvIqCu8eBqwrHN0XobDRg6r5px/0LrlXuWuhrRTYKy
	yhY6XDI9IXwuMSHQkM8AoFhQ+v6Hr8t/gz055tSfKkQ2a7+CdzLjgxppsVVDBKOXNEpZull
	ghNZhDPNQd6ytqzQZpUgTS0DQEnA40CsZjoYMR3be4787jdy91VvAmEmcSFg+c83ko7ofE4
	dSaYJlbJwhon8ypFQfT6NAEcjTG5Vs9VkMGczA8yuNBU/vSTaYQj4ft+Oz2PNd4dLANChEx
	sSoEZlGXL76vnWalffD7EFGgOu2KYyyMZQiI5tth0yg0N2Sr1SIsauScGXP/hRzfMX7PHxC
	ku0lKr96SkCmY3LPHwoRXvPeWurLSkIi9dnQd/pJliT2ZFlaQJPFkfUNLY05hpvajdHWaH8
	tepuwCK9W8Fq61n9+T0Ue2ijBpH4ZYnUr9H5aKMpQuirR2rgtXHO7PbZ8t0mcz1zBd+c5mG
	no3+QuZwze6q7FnRZbdoxmGxvGMWyHDDsqDrCc8sx4c+pudeOd6nlqGxTztf/0V71Ii1ws3
	FMFH/AzQCkC4L1SezL2L38uJAsmckPz2xI2o0PtOhFf89NuWkcl2yd4jO7vqeOlOLR0vJLN
	iwKI7Tcz4y6v1PSOhQ30mE0jA93HoaKk2l56cKVQEL5qmzYfSbMtFL/LDVR43iclQQe+8wj
	DPvjiEWywpOYUR4BL8YDJl9PU+CYGUJI7yRudgQ143Aa/kyvN3a6UmtcShravaDrQ==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Add myself as the maintainer for the SpacemiT K1/K3 I2S driver and
its devicetree binding.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f7..18e92a05e467 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25427,6 +25427,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 F:	drivers/i2c/busses/i2c-k1.c
 
+SPACEMIT K1/K3 I2S DRIVER
+M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
+F:	sound/soc/spacemit/k1_i2s.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260803-spacemit-k1-k3-i2s-maintainers-7a24aad9b091

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

