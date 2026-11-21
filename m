Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264456;
	b=VBJ65gaDKDAn6Mp9Z6j4p7pJTEXUO290jCcZ7AQKDDbSKsu3hnntlWhL5XssaDvLzFQH
	 iI3Qca2MwnfXkJYxeu3vWyVyBXngGU7wLHBLCdT0USoMxM+VZ3MYQM9g7WQjXhG1RV9gz
	 SIqm4vVNkz5AnFdYTTvdrk+rXPAo998NmWBEbKqjzHFNixEI81m3vM0IKx8IJHF86/hnV
	 3pInBw/qIhdjGeyxwnWp9XRqDf+jnACxsa1p8fLWxRRx5+uD0jmKkubm1GCikFb7okcAm
	 +4/8R9byVTnDOdkp8pv3u99GCGXH3cSWFQ1a6/jC9lSnAcfkmHx7ggMyQFscPLzfu7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=iKT+w4ILQlIv6MlRppVHnUI68FyRECXfVXfK6hgGR+j2dkx5EH0/48t9rSne4VSLRKRj
	 N/eu8kGONY/XbHFw+vyv0Gfir/ErOiQJt/dQIZWxxbIB1dczQt2OU5DP/xiJiMcytg5/+
	 ODfsMUVj5tC7bm200CF4k4pcXSBZbfTxfcRPB2gtCohrC6JbgpDAE26DiBS+J4J3rPXso
	 ds9A20kg+vtsqCnCaTLnWItctuXhSamO2PgGKMiDS1QXVAN78QOnRos3sTZzd0sjpuzVv
	 hlTIN7pvmVLwj7n+QmP1zsS1lyG8a9148l69jhgGM4emqjTvcjzA1xmIhoTAm1/geZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQgSQQVE;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8529E606A32A
	for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 12:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8529E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQgSQQVE
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b546061d58so3893213c88.1
        for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 04:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795264456; x=1795869256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=hQgSQQVE1Yg5CpJc/19imBMjUu1xfs/WpK/jLJhA4pljZFlH8/K2eWrBMd9Xb8O7tT
         g8eHdEcL3JexJMk9wUEIi6oLTppDb4cTvi0IFGdjCckmf5z9SN9gQROQ7ZqffJ+oH0kk
         dbOubHYWO+N4MOCNUXY4SByA7J44Z2heg8m6W0oRy9OTw3nJzow8xGbos0uXkaSLkUeJ
         gvdRHgbp8r9RsTYySFvECc4KhV1/KLpOrtLQnoWSzHYvAQddwvA9qkxodQ+60BBgTI9K
         hSpuXszw6S8FZmnqqaiQAeNCJqj+AeV7Fu1awDfUIlv3pW0PIKn+3pZFeg1u41tC0NXN
         rFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795264456; x=1795869256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=eDmmTLsxnkRDq8qY/UPouR2EbPB3E+4Ib5D+I7YqBtI1D7J02W74Wm/eo7Imw9OE+3
         b1uOo78lmJyaDcSMZ8zwYY4IlZK8UDbrc2pO1CQ9DhTKwiBdQlLyRHewzAp1sxYEBTXK
         qo6lIAMmmDTSJUpO4r76+4DqYNMjnpslnwW2/Px7B6JvlMO5y+W63lUTkt1IQit3eBar
         P9pFkHHuyHWAatMqMHi5Y91YuqVjwyorQoYAmYaVgP2bBgYpMSiD1YqSifK35V3lGTeX
         ADthqmeC3GZwS4sQ7pv8gglZLT049arQxQCHBuNHKa7jTKQczPgFL8WBc8AIOmqL4uyU
         cyfg==
X-Forwarded-Encrypted: i=1; AL+hErF2x0mkGtyX91QwCbzkSbIbvhKSNVGjH3rAy09NS7kwWlgt7xGVz/zxtmK9XoF5qZ8NcJEBLx25Mis1rA==@vger.kernel.org
X-Gm-Message-State: APuU4Z96wFFKUaCq+t2Zy2XEfr97nqZiafYHQ9ISb5dKIRlfZdB9OcBA
	/dVT8z8e4wgikbMhvS85QKL1NZhW+WHxFAHWLu1C9q4tBYVA0/qgRLNE
X-Gm-Gg: AZFdTZepL58PLFkeg6ZmFppl+2B24Uo0SAf9JzJ+NYMBCrIwmp/OiRvKGibmV0UGVKJ
	6cAPFrazro9BrgPpHdJTNGFSPmKiwqgVw4roj2epRhb70FkNSOdAkprysmMfwHxhDQtbPhYmBi6
	Oms7TDRjr99Y4Sh+DuPLRQ1Pci6fOl38lG4P+q/9A6n23Dk+3i6O2G8+e46JCZqVNcAqkoynekZ
	zhbIwmnQqm8WQ7Mg4REMqW9RVzmHjeyakEr+LAS7d682KSi4f6YkS5qHRdPrI3P+YeKgg9mcAoc
	ui5JqEQhySFSY7TL7936+okA+ha+MJ4RUUKQ1dgaGt1/DDPziWvCAMzX8trJo4D5NriNGrTZGLI
	dumcVLtSmc1tQ9pRer0dSf4/DKl2t6UEeAx8Trl2gtOyaaB4aUwnj8yHV6zdMGi1TxpV+Q/vYU9
	zw6xUnQtA2a7mrOoDAAz/urTi7fsLxfOaA3Mz1ZBEZ1Nl7K/J/n5+59c3eEJEuEDVV19jWNa+Zw
	HZiBoeW8Mxso7i9h5lQ0xoQ1uup1yCPFHSP+FvtYlKjdwYlU9QsA1D+dX0bqmKZIzdR2zHOUk7M
	oBnHYmGSAEUzqW8YcpSxXKvkMn+ujxchFRMdWLxHoOd5fdaxtCc=
X-Received: by 2002:a05:7022:1502:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b5644a3076mr2154983c88.40.1795264455644;
        Sat, 21 Nov 2026 04:34:15 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm24366451c88.9.2026.11.21.04.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:34:15 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] ALSA: pcm: Avoid reading beyond ELD monitor name
Date: Sat, 21 Nov 2026 12:33:53 +0000
Message-ID: <20261121123353.2617-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <874idbwhqo.wl-tiwai@suse.de>
References: <874idbwhqo.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
