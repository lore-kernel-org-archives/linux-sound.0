Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011111;
	b=AaOAOlE4WAukf1swFJLDV+uLl4Ncw0TzXbKZXHbInoBHD95bNmOt4LtIrgBf3IOFof4a
	 N8K4yICG4TxUdSr5gt9LPua6dxB0XR7TU5o9yXJoox8mCIGS52q2b2KkXQ2DN9Sr1+zqW
	 u3sOahMN++JQFs/+Rl9FV4cAkAFlNgQ9ESSaxxWAAzgZdSVhvsS7bf5GRRBEThynXgFvp
	 rgegkGJBXFHdco2zmhH1uB5ZTCjnGI18eHulD8HuVVkC0ICbGZViC1BJ1ck1Bb3c8diZ1
	 LBdLNqlWOV/xyR7yvs8d2lJdN+/ejS/UMRCPnC8ESqlp/529v12RJnsJ00VpNqqqpGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=IGAPUg3ytMyNvBVCMR2bHXDytedURoGykGdM8Gbon5H2ezotIfVEw/esvJFE/exgbiOS
	 43RyYBFhHi8gB8WOanRz6G7C3no6lkOJh4jYAvwLBM4FqJVoJwWXs9KYKDfKw76PYmiFQ
	 M8dWxib/2vuzn9Dh4eX2cx+ZsVACarNx9VGhmNmIWGpf/LD9rJ3aL20YyXPQht4cyrcBd
	 8WwI5yMr3s0cdPv/8EVMOI6JMlxuFDYpNUzo3itiYhe06qCN4gC7B69t5HaJFjv0WdraM
	 X01F4fYc5rba0oic4sgkYipgtwFtMfcd2X9IHIijqySb+I/wlIcIQZVGd7IxqYhoOIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5rSQlMu;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C8E606A339
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 14:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C8E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5rSQlMu
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-382f4710a17so1112143eec.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 06:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795011110; x=1795615910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=D5rSQlMuKLE1uUJvwNLZqV6+Ba0MLRDiUSgHSsO6W02whCYvJFWEnDKlXIqAWWCunf
         pqyG1mAgrqURNAnvFSZnuYKXEAn0XhMYTb03ighN20qXOXEYYcwfpdiRM8laMwLegE+w
         2rBq+voJWnjxTP0xEy9gpbyGQI3FhxqEHkWgeq81Zjcvh0/FE0hedh0jKMmPsxTPTyMd
         N9UXQaQtt6y+bg5DqvNtPKSQxTgWDYZiMVmpMXr69Ef/IRAhHawOGi8e3Vha/XvXroBK
         52FHIsdlQxgkfCJKGFqrhX/fVnG2U+3ul5d4uUiRTO04wuwKKXS1ImLupmJd03MXdjGu
         Kfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011110; x=1795615910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=PdNp6Vti7JUQ8IVD+r85TiZ+kcLYVtKUtvOM9Lj/80UnO6/EfQKeH8eQ5A7p99mbXu
         7IlTx+Yx3z+KtS7l+0I3X3sL5yXAiye9wX3w43B5NACTIP9MEXKm8qaBF6r3zLEUTR9n
         GAuC3RifjsWVT/pT0ce0smMdBBn9o6An6NCshmmiCzrRQpGKEZWPte3BMFLDIBwUs149
         E9S2WaUagshvZnBoWtLeLc9VGEnp7o296StxYAxnbfLOZN8DCWQ3vT8ZQNZ/jLKIAcuU
         huVMppbmRKESThT7ejqzQ6c2Q0pBs/HevilfMzIw93Cou68Pw6UA59LH5xPNL7P+pEZA
         aoCw==
X-Forwarded-Encrypted: i=1; AL+hErGrrNvW1sx5Y3QBSb2/kqG0oiPtYOwLB8obmt6UpkwxkJYCcwEHLjyVcmiQ9BJSSbIfkhjLlFAHDw64EQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9QS3b6Tt5fm3HRYgIqHPUc+UuV4ROf0PADzYTZS1xW0BqSMH09
	O0E5CRsZyi5vv2XwhMvT0e1pDrYq2vKbzl40QkbennnUESxZuKD1r3mYZeqldpcS
X-Gm-Gg: AZFdTZeqT30kBa4ROqG6sS2J18R8XefAd+wGx5ivGdJ3xybXCrbN9PjwsZnS7PMh/mb
	YY5otbB67dGh7Mrv5FLl3PtFWpmcFSD4DHVff5DQPqxhMo210na7W/JRcO+zw9j8uURURy0c4JL
	M1LaBrN3EuRCq1cg20c/njOzSpMwWTbhdqH+0jAeMxxGARPFZkRXE2EkX9bQWku09wx0Ej99i1+
	eOkp0j/5M694ABw52hW0g3yXdFoHB1o/rIKFaxu7k6RizDo9W0hOBTS5bdo+N8CZUW3lxnrOUtj
	jKuNAnWJOLEfl34ZWhbLuIHswK6fAOS0bCEDyobGusKfYzCVyk0t0wes07jdil9IgUBaoZntkDd
	l2vWy0XJPEN7GObg/RGwepLQnatSAOb8YBqF89FBIMRWBPKC/WMvbaR2jcQJ5LnbfW0OMoliAxK
	pDRzkKrHR6NhgqkDtRwXAasXoNhisaKhBozC7dqgTLrFUjTweIgSstoI3DDRP/qzAOVAQ3HuF+f
	XG/bTHJiDRzZuhrIew8f7ZDoBbPgZzgY+I/3ELauoa7WaIZmBXnKVYO8bxlouIdw60Je+hN+WX4
	+1kY+30dbkgvhC9o35AAM02Mk2Bfac4egQHXMHG9+K4zz0JjkSW3
X-Received: by 2002:a05:7300:de4c:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3828101de20mr2859774eec.20.1795011109256;
        Wed, 18 Nov 2026 06:11:49 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm8414678eec.6.2026.11.18.06.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:11:48 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: core: Validate card indices in lookup helpers
Date: Wed, 18 Nov 2026 14:11:14 +0000
Message-ID: <20261118141114.2709-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87y0aqwbbu.wl-tiwai@suse.de>
References: <87y0aqwbbu.wl-tiwai@suse.de>
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
