Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571F825B2FA;
	Wed, 29 Apr 2026 01:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426757; cv=none; b=uRUgWN07oGWEDO+sjCxpi41fy6bxhssxlW3y963h7dfVda6DL04j/rTMGh1g5zpggEVpEY86fMq9oZKKubhB1m+Yi7JM/LEy/hg7KWqFWFpY6rL8Kc1v7zTZ+DB8kQzE2pDU3nEuWxxTwtSYR4ZHfIBGXP4ULZuSs76fggeP6TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426757; c=relaxed/simple;
	bh=TN3IekLzdp18HVU+1Rpq+9TEk2UtnO7ag9ShWepOCxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGAepACnDMpZXaTao/vgpTUAwwNU2fDVwg4YextvzqlVTwU4XSP4Uws+608mZqF+QrJu08uB+qTWX6ayYaWK5+JICP2aX0qtXnHPzLC9kRs0OQhPSvHhHz6ZYMNMgLznXNR0RjGitX1krrOfzKwBuYVaSBKgmvq7lJtdkMjYVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=w8ALSAXr; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="w8ALSAXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426751;
	bh=IhNm7b5aaqeGytIsBEHmKesKKDGy9a0voGkBOun2Fb4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=w8ALSAXrcB5slO3vMAEilljRcTkxN/2/vWCx/BUZQ13uZ7y6aZ+jnGJ/3GrI03kqs
	 A4IJfYoJSG0gc75J5mM5j7noMhPY6eku74LA+2zIBLgZmqG8uPsA5uNv7v7MvMhpa/
	 OFjUeOQO5WROlcpVlebB+x3QMOXeekqkno+7CEWk=
X-QQ-mid: esmtpgz13t1777426747t360c3668
X-QQ-Originating-IP: rd3CXtHqGvswSSKw6JZjHsL50HqUHdZsoRaXYQ+43t8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7139710470832578007
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:48 +0800
Subject: [PATCH 3/7] ASoC: spacemit: adjust FIFO trigger threshold to half
 FIFO size
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k3-i2s-v1-3-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=1063;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=TN3IekLzdp18HVU+1Rpq+9TEk2UtnO7ag9ShWepOCxY=;
 b=ec7QeL6JrXUVZ6cJTDvuUdDooCidwlmr8lArWG5oMoYjQVIX6WmJGiNfPdpsvXXfGLqXc069i
 /HyE4YCuvkYAufz1dVpsxL1IkXIvH2zfUQfXE1mxlIB7tMZqKJGy3L5
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MydYCacP+cDPw+ybcMtVnqNHyV5jWfq0oQKckuQo8iFxq4X/1cJb4lZw
	Ib7aePYK8MUjrE/gduReSZFAd1QWr/7LzMC7L7LfX6ruVoXCswXDyhSFFRcLBcpoZKj6Zuu
	aliZcTxzHLiBNZXjWJeZpz/L3YvPxwC1Vxz3HrUtexzvzdKLdvo206zpBDq+pG/8YnYzfo+
	lbQTVhNLQIKeH75Eca1EGHv07KpBKvWcwWOGzlwuDiLt2NTfm0uyKHWi4/EsNiQ7EPQPuWS
	z7DcvqJIlNjuf2X6j94CCs7yatI4xjqh9h5Nka34nKGgvy0IHQnOPg+maurjRrqGr2dn+PJ
	1ImtDSujHUjLRseCNH0rc0+wymhYXm2Jj40htL0zmMlF8ZTh+l3OqNE28ZAnVhYyia54g8e
	un6FfKcHYjUrm0T/kiz89FxihBkdqZOrXMmsHXOlPx4FGO+mA8DqNcXMe0POekHx+DUHkKh
	rm8zX+qKQS7afWfvAc7BdJT4rpBrz1rzUxBwpHRY6DOVy4Xh64f1koxwoGt4ssvmD1tLM3y
	iLj7y57tvcIbUYaVtknwEV7C5yQs9CTcsxv2X/RWpgSc6oPjA+yvFfE6M5G4m7CpLY7jmOi
	sE329vgV2uKSq3nKFL1kBVWzTY8Fjm7Y8h9Emx0LfvSAa6VhXU2ki4FNDuczZTvUPWBEVTo
	3ZszcuBREXjFAsn3HFDkm/rUzpVQQzpBGLarWpnzBDVVDgmY2kIhRUWhtPWZcy1PhSTP3LO
	tP89GntTHWc1nUGzLE2h7MAVYjM04YcNCH201TxKZ9S8fCGfyAa/4m+Ci3jwI+1PTjGZaYY
	o8Fq5rAK7IfNSjnFjywoFxo2Tfigs+Jih8+CPI3bOQM7rFXwxSuD14dUWVTK6f+RKdXZ/OB
	KhZXn3WZZsLh14pM/ifKsmk1TfN3YSCMWlSRTzCiTP4vropGuyvrY+HDFBLnbz9x0RCxtW8
	b7JfDw7NIBvxlbHRSPwX+a6ZdOvp/+53mtfe46JPG7Cij3oQecLwYSCva/rB2HOY7vVqkrG
	M2XZ0X7lJEki2hgrsV3gtp3rZLQMFXKVJuZd6BnAMctiLzhIUpvbX24eZn0WKFcpKXTB1Zo
	nWQqaCuxSJruVhjiWeR8XrgYFPdyvfCjtK6TJaaBY5PIL7xgFqO9v6eXNlbHjXLco0UyBgj
	9e/lO6T7hdxtndI=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Set both TX and RX FIFO trigger thresholds (TFT/RFT) to 0xF (half of
the 32-entry FIFO) instead of 5. This provides better DMA efficiency
by allowing more data to accumulate before triggering a DMA request,
reducing the number of DMA transactions needed.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index e59624b2e23a..cef883ba4de9 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -93,8 +93,8 @@ static void spacemit_i2s_init(struct spacemit_i2s_dev *i2s)
 	u32 sscr_val, sspsp_val, ssfcr_val, ssrwt_val;
 
 	sscr_val = SSCR_TRAIL | SSCR_FRF_PSP;
-	ssfcr_val = FIELD_PREP(SSFCR_FIELD_TFT, 5) |
-		    FIELD_PREP(SSFCR_FIELD_RFT, 5) |
+	ssfcr_val = FIELD_PREP(SSFCR_FIELD_TFT, 0xF) |
+		    FIELD_PREP(SSFCR_FIELD_RFT, 0xF) |
 		    SSFCR_RSRE | SSFCR_TSRE;
 	ssrwt_val = SSRWT_RWOT;
 	sspsp_val = SSPSP_SFRMP;

-- 
2.54.0

