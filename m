Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628134;
	b=Ukx2KR+4veZq1c+L0E/y5iLQllToU90WCjpzRD6x/7QNq+i7r2Ss047KD7B0nmreYhDO
	 YRFJrSCiI3P/oA9KRD6LeXEUh4ccyEf9zjzcQSVV7QFVySnk7ZVGZudQNfvu3lOEc2u6s
	 6W5Dl+cT089dTn+TV1j9tXuRpSgmZbd4B8xCUqTm5Sy1nm9kamDNGnWVuJMjufl4gm5PI
	 OlcajxZ7zRC1fvYWLILQesXipbZaWI/e2agZNy0AgGV7Qn3bYRlEIzHgtRflS1QwZHtiM
	 TnVQ1oN2EQGpwm/lzwZNeJ+S0htSeSK0t43repvEeuvXP0dRJLUUEwEsVoldrAe6gFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628134;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=gJwRhqf0LAejTFRxe4dCCo+zvDefM+4IYJxcRIxf3aM=;
	b=buRukQ0c4pPVnYQnm2R4ZEo5/o5LjUxrwqV5zqzgboReS+m3ZdA+OmoKUbo/AsXoeV5R
	 FqmEdaCsp331lZKjblTSPQuSTZ2QrvXOiyFVTT2HMTRMW1oYWnrORVanAEnfhsCnBr4rT
	 hZp5hz1IyfZjueejQm1oE9dDKGyic10Nx4djhjXwUJN+5Hv+IoD5QI75YA0L0OiLQaIkL
	 8dGpU1xiMoJaABIu1Bip7J33PXN+lpvf1WwCUB5zz83za1Ti/Rdc/yt1SOHoII0BAci25
	 M564G6v+wbOBaXQje+WFbxEhAqNsY91bXC3UDGbX5FhfmrID9KoeLLCwgqJH6OnF0UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=NYR0d6Ug;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAF5606A321;
	Wed, 25 Nov 2026 17:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EAF5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=NYR0d6Ug
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jZRfB0lcSzMlpJ;
	Wed, 25 Nov 2026 18:35:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795628130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gJwRhqf0LAejTFRxe4dCCo+zvDefM+4IYJxcRIxf3aM=;
	b=NYR0d6UgNgDQEMFl/JKG8mEdmFDaE9T7rRtLLWyxfi7+hy9wN6/brvu2cH5ysDHflRmR1P
	6sUwPlJ5Qc9nKNtLBkf+NHp/VCsQj2+QqKQ2p9fAJcpirmUw2r/mnA3wvTVUn2Ec7ouW9h
	iU2x9116IsobU3JMKnv3fVP3YejuDcq6F9TM8z1SGdJU8KdrdR1U4uS/LoHXC33Cog8gl+
	yIDk1cKkKe6s+m6fYkbms5U9m2V2a+U3Zav3Im7fYiAuVj5Zx8n9By/V+slkm+AIL+CPX7
	xlAvOYtY6fBMPL2+RroRxcHLF3SkjUicDmviEScKz0djP3wLn29GLItIdFyiHA==
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
Subject: [PATCH] docs: soundwire: stream: fix typo
Date: Wed, 25 Nov 2026 18:33:29 +0100
Message-ID: <20261125173328.1618271-3-manuelebnerli@mailbox.org>
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
X-MBO-RS-ID: 57812e6d3052ab078ab
X-MBO-RS-META: 9jasrh8jbpf1ubwn4bqf7bs4ibmbqa8c

Fix typo to make sense of sentence.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/driver-api/soundwire/stream.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/soundwire/stream.rst b/Documentation/driver-api/soundwire/stream.rst
index 58b05f2d0b..842b61b19b 100644
--- a/Documentation/driver-api/soundwire/stream.rst
+++ b/Documentation/driver-api/soundwire/stream.rst
@@ -251,7 +251,7 @@ Below shows the SoundWire stream states and state transition diagram. ::
 	         +----------+           +------------+        +----------+
 
 NOTE: State transitions between ``SDW_STREAM_ENABLED`` and
-``SDW_STREAM_DISABLED`` are only relevant when then INFO_PAUSE flag is
+``SDW_STREAM_DISABLED`` are only relevant when the INFO_PAUSE flag is
 supported at the ALSA/ASoC level. Likewise the transition between
 ``SDW_DISABLED_STATE`` and ``SDW_PREPARED_STATE`` depends on the
 INFO_RESUME flag.
-- 
2.56.0

