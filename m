Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028882;
	b=gLAEVkUSUhN2SX9urwRlLWO26IPwNBeJkdPaVaD271KLGPnpmbG8B9w8fEIrkZi5v0sd
	 KzBD6hfmP3Av2Zd1IOBD33Wpg+JxlOtBeLVrsUe5LKxjikChdxp5Kr5XKtXAqvnGU5l0t
	 Llf6DhY3xt1khHM5LIsHZ4R/C8sScKkAMKDudnTh988MCNfQMBNaUwfzRWbIgn8k7+O/z
	 JFEqbFqOqUN6YdhNwgJl7cJsitDvGCAYlCD7pBDF+wx4lre3K5GGkO2xmaO59mgJ3VRwx
	 /YIIFQ9GX28R7N1lVdiIX6YCMmJJ2NcNX5uaI1MBpMte4zNzF63S9bnSc98i+RdoAIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028882;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=ddmcfOMT36ub/WSfnc7vyNXOjLLAnlpQ7vBbWbGIDIY=;
	b=HUBd2pwPhfn7qooVD+yd+fN26mu13ZsBu85q2Cltios+KkWDkMnDqEPmQcDJqxeWG/nU
	 1cJsHyKWZE/YFtQWbNme7e5plErJQGiXADp9NUj8HAw0UVvZ4HYqDnc5mmpn/RzzkaIVk
	 VohTxDzmh1UyyCCTlc+f5XT6WutjgBSQTOVZG9ZG944Dec3Il8/Qd3R925jOf3HNg2dzS
	 u7i9RtVvvHC61eI+XeSO0OUOx9syAyGpczUrXMQqSGvzH3VB88HJnNNn8QJ6omPeLnYgw
	 a5OymwqxEjONKZ76pt+L6m3RkIl34mFQhFf+MczCKsBmp8QCLGdi7g3PXZ0Gx4zY9/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=A8PfnZ2f;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2BE606A33A;
	Wed, 18 Nov 2026 19:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB2BE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=A8PfnZ2f
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jVB260rzgz8vR4;
	Wed, 18 Nov 2026 20:07:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795028878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ddmcfOMT36ub/WSfnc7vyNXOjLLAnlpQ7vBbWbGIDIY=;
	b=A8PfnZ2fXXlaRpM7LuYHV46sG+n5g0Bk4AqcIQcS5/fNpEoX2HxSX9JhTs5XeviktoUNjT
	PeG9opNkvYP+ZZuS1mOlzY+iC3V8SQsDm2CyM7Stn64T+5WH637QGaTygg+BoNZAsqQyfq
	tMCJ9JKme2pAcHnS+oKU2re0mn1oOCoJgVu0XfJvLqIjEmWyLAJT1jPLsT4LLKlYa/Mqy+
	ny640pbb+SQqRp3dF6nWvxo9HFonu/1DL5sENCVYnY8mCopaj8m4jFXLx5298XN20/jyLx
	Q7NVF+bNi3NGxUmSuBcV4cpxET/mXvmh3h0iKBRRM0vMYPT5BapFrHWhYkNb9A==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: soundwire: stream: harmonize diagrams
Date: Wed, 18 Nov 2026 20:06:52 +0100
Message-ID: <20261118190655.1179347-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: add99da8afa8268bb16
X-MBO-RS-META: g9pffjxyieeqieced6qax6i79qm1mwkp

In example 3 and 4 the slave interfaces are in an equal relation to the
master interface. Reflect this with equal arrows.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/driver-api/soundwire/stream.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/soundwire/stream.rst b/Documentation/driver-api/soundwire/stream.rst
index d662012996..58b05f2d0b 100644
--- a/Documentation/driver-api/soundwire/stream.rst
+++ b/Documentation/driver-api/soundwire/stream.rst
@@ -67,11 +67,11 @@ Slaves are using single port. ::
 	                    |     |
 	                    |     |
 	                    |     |                        +---------------+
-	                    |     +----------------------> |     Slave     |
+	                    |     +------------------------+     Slave     |
 	                    |                              |   Interface   |
 	                    |                              |       2       |
 	                    |                              |               |
-	                    +----------------------------> |       R       |
+	                    +------------------------------+       R       |
 	                                                   |     (Data)    |
 	                                                   +---------------+
 
@@ -93,11 +93,11 @@ one or more speakers. ::
 	                    |     |
 	                    |     |
 	                    |     |                        +---------------+
-	                    |     +----------------------> |     Slave     |
+	                    |     +------------------------+     Slave     |
 	                    |                              |   Interface   |
 	                    |                              |       2       |
 	                    |                              |               |
-	                    +----------------------------> |     L + R     |
+	                    +------------------------------+     L + R     |
 	                                                   |     (Data)    |
 	                                                   +---------------+
 
-- 
2.56.0

