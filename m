Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044539;
	b=4w183SucmWl9SZUaPCky+vraxnt4hnfbrZH7XrL1s/Ch9ZZ0cvEhfhD44zkyUT+96v6d
	 TZnYGgnvfGfjsn51dWLm12rVCqBI8FEWA6O6vv7AAAzDgECxI5WbL0l0wRgslPgSaMbQw
	 8gHNqWW05nNe4ny2El8c+gShJMEbg7DNTLAPWefWdTniJrzGtSZRQRpdJES6ejMPznUXp
	 fXe4o7orermJBxTm9Zd8RCygLbpqiMlpuaSDa25IX7UftS4FQDA0wseylIsAAVIxzZq6U
	 lwm2mrqpNglmLJXK50a0ZIWvlu1d1T+CALL+QI+eh3/tq1H4d1zdb5x34/izc7qJ8xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
	b=oDXO4P/lAsq+MtacP1UZShcSXdgQcJGrzWCLy3/d45jXGsrJUuGO9T3MMIRwU4nyg08N
	 +i91OF8H7z4cC6FnnxsrAG3zn62TPvFtnbXkpJUbdR9XmMrXbuW+ksOjrXjL9aL62Ekor
	 BKZJ/NvTDixphq/kQFbnJs/WrwX9XBL//HgOZVt+k/qS9bvA89vD2WLO30mGnECVXc00C
	 OuzvLkoBBfziWj+C14n2OHP+WW4UbgRZojQWEsrgUBJKriyzA9x4rWYe6ugHWlZaFfgqQ
	 mXi6UP1i1E6AVoXDruob/FusbXfY2UVCUezeLy2DtwSFUskWFErpMqAWLLx7tDMy2pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PTRW/zf3";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE310606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 09:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE310606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTRW/zf3
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1906092eec.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 01:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044538; x=1794649338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=PTRW/zf39QqYqtZSHb2mq3WtdfFKv1KzP5l3RCelUvIIec//xJacm7JjY4gW+N/fMW
         AQwI3FC2vXQXhTvRrVzfKBDQ812xRGCXASd2isLacrn8ocFsO5pTqZQHRJO9IZnsZcsu
         ncTkq7L76dQ2putQaFxt/eseUGztTDwdbum0U6S9AzqlYY5sVQk7Ev4XV+zzY8q2B1EC
         71a8PrSc5lVQhUwadeus7Y8pUTbQqZDC16HCmYdkQ7gyLNOqEvYIfibhFesIPI6QOPuM
         x4jQBdzaYLgKsUWkzIZ/1GoDElLUkxRq+ffdf6yG/v9EIERo7pXlkjqDyik/5q8GljHw
         GrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044538; x=1794649338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=EwNlGBEySkZ2E4B9Jq/opW/VlDUML3xjcEXT+8/wXJbNXHVullcdeanXla0AwQLqe6
         o3DSpP9ziCEhaESypv6loIh+gOHe/Gdnp6vI6p75c6ZhKkUNfHIprapjzduTSfji76mW
         MkFQyCO6y685SQ8HC7F/aOC4urHxnLgcPiABtTXfb38MR2S0DWFpSTb2faY9ZgqMRn+k
         cj2YCwhCPsRrq4Ob2PPSKoXoFo5jAZiysTihWhmu0x1xPCx6uWMJyO/ueXPKBAqFrsrX
         jqaKdE5iNnXJ9k36zvMME59y4XfYfy+8fL0L+whNROj2ydPJFnI7J64DbFVRmB5Txg+w
         oRlA==
X-Forwarded-Encrypted: i=1; AKwUvBwIeHezOaQCiq2xkPJhZ6QWV4cBSa/CbFppIDmp+ImfFumprQk/5rmYxUchHyN/I594QmUN9QGk3MWWXQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jnkdWLZ3krJzlT7TyjjZCsxRCi3PfJ6k0QjRRHd2DiCUs5Ihx
	WpWhp+MD/qpbKMBm+CgWDe688F22qLH7dXm55Fg9vJX9H5SiwUeX6GTd
X-Gm-Gg: AYBFou0hleBgGOlI/YNOlDoZvuaux5+v7OPRyQJmCaSt86DfmQiNc/XJ9tE/7SBRzei
	IjuQ1AwCN+uju2tQidIbNdC4IQ7h+O49nLeh2A3gL/91dJIf3eop+PYWqiggjBaW/PIwxymIy19
	S1EaWXKnI4YwoL+iZwBZeFw790XEHM1KnRktlko9PEwFahtiu5CFwoBzTC3IS7KmR+PFiu64+4a
	DNZKK+AbSwBXO45F+9RuBzjql6nqI1JruEQv14AmgW66RIQM+/4PbKJwfwZFL9gsY9gUi4VD57l
	vkDNd9SHdQ5ZCTevzDXIALfF6KQvSPCPl3UdrPDim7MENCPOxb5bJcdK6VcsXBNrsVzaFDJ9ggu
	RPpmOieTvfd5u1649WC0wvv9if7T+xkKF6IDxhDqpBvhWq8rvl8QybKwF1HtLXmxQnjrFFIQr70
	yfRAEp1z8o3oHe3lZf0RFyRA+aFQQsTsxjELYM0SQkjiIKg6Hrizl7xhn+zcTWF6sUDfQEPLfGr
	QiKs5opUnFTDBc/AFB9aHGqObuhRo7mNhQf3N1CVaZ+7VOgrYPlibJ7hzy9giAROy2gaPyyzgqz
	HjOZeF6IRiv+5hNpfCjcO8eVVSd1Js1DBdqWDudVhhu9++5bLQZvPglH8npo1xm/Yq9ZpcXFxI2
	Hnlqzefvcw0WlI4iR05hu9i1OHhFKP6Tzt6EHnCTBQnk=
X-Received: by 2002:a05:7301:6190:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36f75839295mr6934058eec.15.1794044537919;
        Sat, 07 Nov 2026 01:42:17 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm14392110eec.29.2026.11.07.01.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:42:17 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] soundwire: stream: Prevent m_rt_count underflow in sdw_stream_remove_master()
Date: Sat,  7 Nov 2026 18:42:12 +0900
Message-ID: <20261107094212.3951983-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103095445.81414-4-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org> <20261103095445.81414-4-lee@kernel.org>
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

Tested on a Dell Latitude 9420 (Tiger Lake, sof_sdw) on top of
soundwire next at commit afd88e7ad781. The details are in my reply to
the cover letter.

Tested-by: HyeongJun An <sammiee5311@gmail.com>
