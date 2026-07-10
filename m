Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001C7374A0D
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659763; cv=none; b=T49h00fHoIGU6iuupvD8FiuyxjH3LIr71m4f7W65qoDUb5vhzVdwxn/EwSD3LSPO7SfhKRC6kFtAGGlijNcrk81fmHYOB7z12yunjO80rQLnlmQBhhXT2dNMzOfcb2JMposnEGvj4/qHeaGlU2Ysbyl2o4T+Jhn0zvhn/g08/bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659763; c=relaxed/simple;
	bh=coQYYFX96e3xa/9K8nsp8jxNiKX4lVCnimhAExT1xI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QYsxZzb41Wtjz5nwB0Cyad8ghBwCpH5TYKQuC83I4kbq3/TaQnrFq+dZrYWP1VHpkkh0o4NXIIg6H28cBpVaVCgf/vNZyYQ8ef2qtZRa4lyCbgLf4n7nPSuH5xlcJV2SRVXqAkiGoJUsx3lD96EygzC5P3gYyl11wzMYP0Q/YMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGrlHQY7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGrlHQY7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37df72c9984so863082a91.3
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659761; x=1784264561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ep8OkwxVAkZzrs1SxYAMiw1vCFAjJuusyYqhfb+2ko8=;
        b=rGrlHQY7eH30oJnLOAfif75RZcDNUabEuEunO51bPW0DRZfADvwQDU/yvZZZZg1PFw
         +8k7z+UCY1uFhFaZw2AxbYkI4gqWCLlLxxSeNhonEE5DBIOr2/Do0S/qt5vf6giCgz0h
         pgucPJapIiov+8HE5OoFdzkXoSZvVvx/8YUEyrg4ifA8UqQcoaAiRwFVKF0w0yfhhmx4
         3nqrXfVgJRbkiCyFlVJUJuH3ZcqSLejz9w8VShDMKR+gSac0+TcNSjJUWFKyoiD5VseF
         dOpzMq+r3rGfqPhb4d9uzC74V6O5cNqQlA1VuCsHP8GCIlJ1K5t5Ohy5uxfuhnki1WBU
         LBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659761; x=1784264561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ep8OkwxVAkZzrs1SxYAMiw1vCFAjJuusyYqhfb+2ko8=;
        b=Hulqi8i4eQrSgV7GggrrCFYvin3Hoe4UK5efJxT1UYjyyV3bKgOgbXyT5nU40Gvok1
         JFT4XONbdgdJzniifcRYKOxPtmR/k9Ab6+rrzvFANerMxt1w9IXGpgVBhEaYE2eG8/bi
         e9f2BWGC0KdMY1qs+gAqXJTYnXpodSmozsi15jcDEYLDOeEvRcmQMB/qolyfCbJOXcyO
         Uqk03V2vIOdDfEwf3OMqy2XVbmuJ8fFq1XIEYnJgwyVSuX8ffDFDxYBFmqtvAP+/8T1u
         zULTYe1Zmga4sAjZ10LfKYt7wsmK41fMxMZ6pC6Ow9Qdj9ZcB8xor+gAkDUYvYPVHJGI
         0M+w==
X-Gm-Message-State: AOJu0YyfIzP8wcwfhSArZjPEkOCBxjgZBsadUwOZzb4JIokJRUIsoIuT
	VEQhfFEWDdVzdO4A3zXFMEwi0hBgEKn3rrxp4M44yyeVqoUIgawDPo6a
X-Gm-Gg: AfdE7cnEjoctp3dHBKiK6nRn+egSsP6cCR4WrpnX61tLCsYUbnmppEDberoJHrPZlVF
	JTniSVz8eXKBOdvp3LDPF8weMbNfpvkOdhgO8mCiD9APdxHqJ16gaMh1PIYBJiEl8AS0SPDGOIb
	9aarvdibv9QXBL8Eq/3nqzpIbpi9SIvtGbVNmRtS0bA4KQr2ZHHtr2H5kQ9lIm/Gr41mS6lPovz
	MVrs4+rTXPmZAxfosx5sbCAjkGpEFmbQbFCrjeqT3shFQeJBiFmck3RJ1z9ezyLSg/hRLPCpgaE
	7rm3FMyvE6H8vXCSjhVJF4dUNiB2+sjH6kDYCVI3o6mdJS3kS8kZPXNj9abKj+wAPpkbIebdEV7
	P33gsvBxZAW0L8mApwczqqlxquOq8whNiKqEPZ8nToXz72yo8pLGHX6xFgPGtqDBNEoSfcIs8gy
	PWvGXtMjgbuUCcCdLuoLemt7f+fcOApWuQtMXOlrxPh4OTGmk=
X-Received: by 2002:a17:90b:17c4:b0:381:5ab5:b667 with SMTP id 98e67ed59e1d1-38942493f10mr10078915a91.31.1783659761030;
        Thu, 09 Jul 2026 22:02:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516ad85sm2139647a91.2.2026.07.09.22.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:02:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: xilinx: Use dev_err_probe() and drop redundant error handling
Date: Fri, 10 Jul 2026 12:02:21 +0700
Message-ID: <20260710050223.14266-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series cleans up error handling in the Xilinx ASoC drivers.
It replaces dev_err() followed by return with dev_err_probe() where
appropriate in probe paths, allowing deferred probe to be handled
correctly while simplifying the code.
It also removes redundant dev_err() calls after helper functions that
already report failures, avoiding duplicate error messages.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error
    handling
  ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and drop redundant error
    handling

 sound/soc/xilinx/xlnx_i2s.c   | 18 +++++++-----------
 sound/soc/xilinx/xlnx_spdif.c | 30 ++++++++++--------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

-- 
2.43.0

