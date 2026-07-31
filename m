Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E7E430CCF
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502920; cv=pass; b=PdZWKXcpqc68V2NUkqb+n8Ee9jaZh/wDooJugnAwCgPM/+OCAQ72z0gpU8ooGt+dImOlLRBMuAncrQV6H8OBDiuM3jwyOb9T/GOySIGbuR3eyTw31rH7T17Fqn4xL3dY6P5FajdLAjEr/V72jfiEfEjdRj967w4C46kdQgXXCIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502920; c=relaxed/simple;
	bh=mzx8ttNHwzLuXtlRamVskvehDWhjT1KJsIf5grSlgNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T2zMoPIcSot8p0kz7b1RCfvkVi4UC/TQlBb90SXYndcBpEwC9gU2tQfkLcV1Wg8aWTatSD3lE0xMpO02ZYTXQlpZrwGp6fI2gZTrBuIeTS9KKuobrvkL5jmBKIbXorUhYwy06tf2fMheGBgdUGNIsHcQbr5icG4hncWyeAJT5ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=stiKuKu2; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="stiKuKu2"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-80cebd41372so13729357b3.3
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785502918; cv=none;
        d=google.com; s=arc-20260327;
        b=DdOff3MG6B9yOqn1CrNyR3ar1TYyNuTolebRsBVlkpv1e2k+rat0jIRmeRSDLJMuPy
         qmuoalm8KtI5znNA45+4+1gzT3Z3cEywryA943ZldfexPl6H4SN87tOGH2Yjs50JTPuj
         HnNi9Jmwrp7yXcyQLIeHJDeBZZ0NfYnjPLxSUcQ2YlC43lIqhh5KLPJ44JagWUuI7k2G
         9EKi2XGzNRHnclE9f7NeAsaSzYAHFib4635bKfGaWWWfkf4QoX+LCZ0JXzq4bljcT6Xw
         iY9b4jzVE5SGRn7X/PdcKIvMbQ/v67IGGzIPCYzv9vRdoInjRoDAyVMnekc8UVFLf2Eh
         W67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mzx8ttNHwzLuXtlRamVskvehDWhjT1KJsIf5grSlgNQ=;
        fh=YblHzFqwReSA3ahni9mjeQZrgjmy2V64G/FnLxb1bnI=;
        b=NEYOzr2dMdCL5VvPExPt8EM/hx0b2O+q4pLHc69CFeg3dLQy1F6QWrV0Ea1yWFsUZ5
         Od+DZDgRwW4JVzD84rQoM7/rrEzICq8S2+uiYWBhZl+YDVdbCLyoi5hR7iCo0NWQ8Iu3
         s/DMTvsPXXoFaexFZCebxyxWE6G5somJHGa6YExkAyDTh0q3wo3/wHJ1Z0y4blF1Eb5P
         X5u38AhiNxYmsp6lUfqhMibEDtdey4yQBbIZvooF6+KJk03USbPE3IzkVNV4f0OpJrL3
         O05Ft/RKbp5jqLybGPYRHeY8+uwtGUKivORLhcis5OrR2ODoeAG0qCPRW7YVDBZmLdDw
         v6jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785502918; x=1786107718; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzx8ttNHwzLuXtlRamVskvehDWhjT1KJsIf5grSlgNQ=;
        b=stiKuKu2S08Z712BV3J+ja80Bo/OPVR6YpGtDKOUZOs/OymlyHy6Eusn3x3I6rVQsn
         jMiww6C3bQLoVMsLhKYLV49IAm3ljVbE43+2ImcWb9hTfAacKZZt+wzcOvZKzExVAMG5
         eKtE4mwZH3IHuAwjDununUWaOV87dBMXNmHi6nIlEiIHEUU2iiE7++NyXP3c1OUUSqIP
         KJ/+H2CS2ktc70sXDRAXrYXb8zNVByyIKjyHboMI2ulb1J05cj49OU7A71De1/7kgdxD
         Of2RvG7b2YLijgzZFJLpuONoUNYp9+MaVjzEdMJ+k34UVDGIV2IiMC5P0UN9aC7IKW/u
         EIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502918; x=1786107718;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mzx8ttNHwzLuXtlRamVskvehDWhjT1KJsIf5grSlgNQ=;
        b=Tp5Mrn/4u0uhmqeWY2+UcNfoPmmQdqzkHRMe2Gza/xlcPAlTdhpCiJeiAg+C11hupK
         k0kC4gzPXFuqRlEh3ZAW3dmh0abG+ELGXD/HmBnKH7RHuoni5PllXeYpBlKsvTQx+RUm
         1OlGldjWeoYAYt2Y1QU7FwB/BWuPFkQMzB2aFXnrMepJ/oNs63hJdVaiuRGhPwi7wia4
         vJ5CRdfN8jA/JlIM/zp0bnnzJ0KtN6A/nc5jAYB4KdvpR/27Md8Z1o/iDb5hUBItyaZ8
         1IViJZctkAaYYkEolJZQyTTkluhkB+X+pbrGWiVgCnkkXax/yfkfkdEa0tuQmdI7DD75
         gtng==
X-Gm-Message-State: AOJu0YwAS1ZUiBzEtFyDTP+cvKaOIslNRu2UXfdm6+WXKLzoWKqLyCPf
	DLuERPCyLaUaLHiarMn57cfpbnkI6csoll1utTabnOZjCVkGbm7O+vAw5BgZIf2W7iuxXxgqFxI
	MPHvqPCd4HeF+JCcW25KN3dPL26wo1v9dKLT7TEKJBA==
X-Gm-Gg: AR+sD12LgqvsHhQGQflRhsYljo1sT1T4vmMUybCsPwYnqjavbsuXhO6leblf39GvFmJ
	g/6JwjTam18JdQejnQm+SoTthy/nSAGt2tyrLGAcQewsP9SHw9glK5gcEUi4fRSZiBXeZKAzOE/
	4/JzVDYyl36BDpNNhtI/xnIb+ZJpXnvSbydtOEkFmJ0mHLrH0mjmDhMi0Q7YBia9cFcHqcKNMdA
	AZdZIxDvrciex2lKAh3VvFA3q/KmRSwCmo36UQ2X8qrVRV5giW9tLsxx9fwbIKbqBid8Z5kgq64
	MXOp1+7J9zV3Z0zC0TXeqYmejpgQ4sHEAMBJ8+87zyJc8kcZ9ZtYMmDa
X-Received: by 2002:a05:690c:a4c1:10b0:81f:3969:4abb with SMTP id
 00721157ae682-81fce354342mr10275127b3.29.1785502917671; Fri, 31 Jul 2026
 06:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713071544.35722-1-kunjinkao.jp@gmail.com>
 <cf0a24a9-40f1-4669-b616-9e244c1e7876@linux.dev> <CAMTmk-2mGbujBgBBPVtwKxgF7OQJAoS4kK160mrMgazARrV38A@mail.gmail.com>
 <CAMTmk-1rJ+iTfQCvi4kLFBE7Z9T=n2P2xaRDem7P8qAx29PHHw@mail.gmail.com>
In-Reply-To: <CAMTmk-1rJ+iTfQCvi4kLFBE7Z9T=n2P2xaRDem7P8qAx29PHHw@mail.gmail.com>
From: chang wu <kunjinkao.jp@gmail.com>
Date: Fri, 31 Jul 2026 21:01:46 +0800
X-Gm-Features: AUfX_myQ9QzsMybNkyBrv053TUlgpty42yH1leDyC6o6NRQOn1woQqrAz7L9Vh0
Message-ID: <CAMTmk-3kqehCZZuHmndw1LhmpOO3XJg5BKg=pkXmgUefTzaHeQ@mail.gmail.com>
Subject: Re: [PATCH] soundwire: stream: validate slave port against DisCo port bitmap
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Vinod Koul <vkoul@kernel.org>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

v2 has been posted here:

https://lore.kernel.org/all/20260731123415.34070-1-kunjinkao.jp@gmail.com/

The updated patch was reviewed and merged into the thesofproject/linux
topic/sof-dev branch as commit 54c1da4:

https://github.com/thesofproject/linux/pull/5849

SOF CI was temporarily unavailable, but Bard manually tested the final
patch on SoundWire hardware. The patch also carries the Reviewed-by
tags from Bard Liao and Charles Keepax.

Thanks,
Eric
