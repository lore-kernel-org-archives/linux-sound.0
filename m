Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304552;
	b=iG9UEP6Ijnyp9v8bpt98T6KS68viZXgy45cA4oSRdJygwCW88Vy6e2U1eJpmRIey1XHf
	 Hz2hht5JkjEmXMTyNfi8vJMkDNXFD6GsNWiWVQ6k9+RfABd4a5X3cbHAtLGgd3hmQBuXH
	 OzbNIyONkoncldUoMlbV/NVdOin6AhyDDEnH7uxGnYQfVAY/EidRFje3lOxkxgs4dLiJo
	 Q2be21pu2vA5zjzx9q90UOZJD31h607KHIOpnlK/34fkidz2AguecdtjVGPOosQljqNV1
	 BYgu4fXXLow1bWgDmDrHcSldMYt1FSM0uwXChw0GvwGDJMGvilog/mKeGDbshP0WdUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vkfhQhYqxqsCmC3P45GomLdqX19iHipfex8irFmVNrs=;
	b=N2VE66j6qhk7Ih0bQ125qPYv4R76IWfXAJ7PcXo4jX/MVRUlCv1TPv0fY4CwDFq2W9Ao
	 dU88lToRZ0dWnjja2avry9wymUvXjexIRFWNm88ZJf5W7Ak0SYsMPLA6Pid7jCLESfsAu
	 8MHadtNibxliiIMMU590uFW4QEQCEoym4MfxgTD3jfbTTDnCvg/e91/16ux4rkmlpH5gN
	 hLTXNu153lWOtKwdSO90DtqgQg3UUom0K0UecDi7+qbVCcPCEQrSxtleJD5aP+IPGVGbE
	 nZf3YaC46hmmshti6IIiormikgWxj488Cn2PE4G4hxHRiPAY9rLh4Kl72jF052JB3XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KM6vE6ll;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB338606A32A
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 09:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB338606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KM6vE6ll
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3687461eec.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 01:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304551; x=1794909351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vkfhQhYqxqsCmC3P45GomLdqX19iHipfex8irFmVNrs=;
        b=KM6vE6llTuRQYCxLWxxCDbfiXe1bNG283m9WyNS7EquaKX+PfKwGnah93ceCB/kIqT
         +gbXd6xNMAOlwYExsyACVU/fD3qmQG8UvZIj1AzhG+fjPXqDKWerTGaJmDSfw84zTmsj
         d95NV7Hjwxwp20m1dWrclYCqTV9JkuT6NgbUE2i52ZhiFLREjnmY53mldZO6bIPeFAcX
         lP/dDcoviJZ9Vb2iE2EEuO9sNVPO8CLfE/vmPux02YAE+DTUpRHE1vJQuu0I9VwnKpsz
         ADpUFBfISytimwY1qblRxuVvPLGXSuhaVPWmG87rdnkz0qgvn+qOsevEx57XWN1MBFq7
         fwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304551; x=1794909351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkfhQhYqxqsCmC3P45GomLdqX19iHipfex8irFmVNrs=;
        b=yFUhxbxlh4OYPU/D78VCBnZbCKeEnWzTX+7QKgnGBCApj1/xhJERB8nEWLmMqeTxXu
         jrM6woRsBnDSRNlreA/VmGNsX8nwmJENAlv9gDl733FO9UvVKZABNOpA+4FeecjSFwmQ
         AggkBRW+h/welNPnq4xOST2yfwer+UfJyump8dLmAlwEd5TW/Gv9/DgzS2J+3ChGjJnV
         JqkBn1ZOVwRF3WMXumw1zB/RxMQPadkpa2YeAVCEUdhOPo3JXHP07fzDL/93nipQmSHD
         mW6t91hslxpShwAyT6CvwQ4puZTwUgKDsdGVUnRsXe41qEVF4KKyvttlKsMAY7ZsrUEe
         Cm8Q==
X-Forwarded-Encrypted: i=1; AL+hErGPRJ7hxq8n/rA7hoiHmFv4G7WE+sPIpLFOtrQIZqAe9amwTHT1DPnohVzENhoNzS3PkOVcvuXUz6Ksvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9yRh7r5eNwI2jHfyO8e2pskCvfRrInEmzJfAuSS/m4uDMmcYEO
	tjIAXgArX91tH3jj+TajDa6B7Qs6f296yPvA9zFMC2EakNUj/sHWjGjp
X-Gm-Gg: AYBFou1EzNrIxH+7s5LvQJtfQ+4jFBx61ny+F2zhl3xVHPRx+eDpY9dIisGalYIFXpi
	ClCOV35gcW6/+nI0tP3AHELK4DCMbNr3fhTbDIhdIfTOyTCuytWepSDyFdJPA37ToEnII+IiQUV
	eopcEgVvsDfdi5U3lHdSDsK1fTHA9/1EAmxpjFKcac8xNRi3pJS+JX3OtVw0FK6juACe+D+WMoe
	ogUa+qdG2i5JmtcUDm4oGdFsiFK8oarfp3DgyDcfmD4eXuPp7JUpiU1MVtWLn1s0gVISnvisnII
	h29UbzwqZzNME8pjTFFExL/PscMEdkfrXeNpzL4TkMQMcoNKtXhpZS7XoZHMQUVo0p14kuELQFc
	2mBZhqYWKGGx7V/EbG9jH7dkdziBWGz9wJOMtDzNtm4jY0Z0E1rPpJTpcV5X+7yhWRMhQ/9Z8wo
	41WGADgcQcg4RtrlyRb+ezbMambuEY5yD4spdEM2sIHHmO6Appzmg3sfgIhV3dSc/8AtAGxKmPY
	JjrlRqcTxtV9ctj3gD1CPhsHWHiPvARTF/cxzY+wiNOktDA4iGkkVyoJB0KXZqLUcpUf4N7+77M
	E27riqvObofBf6wewiLePRezqYp0AJCv4LKfcZHBdqOG4VAdI4SLn3xc98CVKu/XHBT0ytKrr7s
	jY80bZPueZQirc2rr6VgC6kxqYekGa4RqzC2CSoXSf+qH
X-Received: by 2002:a05:7022:286:20b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b3b61874demr2722263c88.33.1794304550708;
        Tue, 10 Nov 2026 01:55:50 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:55:42 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/6] ASoC: dwc: Fix several issues in the I2S driver
Date: Tue, 10 Nov 2026 16:55:19 +0700
Message-ID: <20261110095525.504660-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series addresses several issues in the DesignWare I2S driver,
including clock rate calculation, DAI configuration, channel limits,
DMA FIFO sizing, and error handling.

Changes in v2:
 - Move the indentation and typo fixes into a separate commit.
 - Add a separate patch to propagate optional IRQ lookup errors.
 - Add Maxim Kochetkov's Reviewed-by tag.

Link v1: 
https://lore.kernel.org/all/20261106112940.53550-1-phucduc.bui@gmail.com/

Compile-tested only.

Best regards,
Phuc

bui duc phuc (6):
  ASoC: dwc: Fix bit clock rate in TDM mode
  ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
  ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
  ASoC: dwc: Fix DMA fifo_size calculation
  ASoC: dwc: Propagate optional IRQ lookup errors
  ASoC: dwc: Remove redundant error messages

 sound/soc/dwc/dwc-i2s.c | 57 +++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 34 deletions(-)

-- 
2.43.0

