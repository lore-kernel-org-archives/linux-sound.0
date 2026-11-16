Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794804867;
	b=yNuW2rV0+D/AxXo48E0KlVrJslL42D6NOnqKYrPB0kNAuRTtav16cJG4SW53B/RdJhtf
	 i82DBCumDJfxmeXPpL84ZfKB+vO3vBDGFGi077TYJdUmtaKof8CyObagA07YamEDt2wBI
	 krP7OnS+2wzQnKa53kjRoUhKkO7sVXyGeXMloTk9xYIIOUgRfCtVlUrKAVaz+FMor7+iv
	 aHJvhlTIh0mpscaQ8Ee7evPPvpIjix/M8PRa85rn2DOPYXOKt/yterwYKWwoLUbTAHxuE
	 wvuBQ5tq4hdwbWkzsER53BvAhwjJamUq6AaJMTfV7ZVsk5AMmf8g2TPt0jD+sPEMs9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=x0j3XChK2x67wNf1p9ICYbQQbtwgRuRXvhZomNQ4ZuE=;
	b=sr/CwLTD1oasCDl/JmtYq5fRwAZCO3K9aOvudOaXBVmLpd56fgOnc/6HFlQPR6HMfM+r
	 CWRXuNFfWpHJCiS0XnSUuKv+DO0ND5QERczHU0gBQHonUHQUw5V8BH/8US+oSlMlKpJFU
	 K62l7wmsn+ndMxa0OzOo/PJ2tNz2RA7VF78QJWCQBFd1NfSmGolVhNJO6XshAVc5wKhej
	 0fpXMRK1JV6911SqXUv4m0l8NYQF1TF4MAYQ6e3J8AvZmIIGuOS1VULj4rm3Sqm4ylqpp
	 v4Y2bA39VvVgdUnkozn3nZvL3ent1rxlBVUn7Bt7MiV6UOeDzhOPGUQoggKzVMhOkTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=otfCESgE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5BF606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 04:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D5BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=otfCESgE
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ed2b4348fcso9493355ad.2
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 20:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794804866; cv=none;
        d=google.com; s=arc-20260327;
        b=aYrDoEoOrY469c6F9K+e15rNUDsC00yJwGlWwVeHlL+PgLT1WSiGd+45Uo0BqjqCYJ
         JSRL8f95hVOVNweQoM4Gq98unQ4QatzfLAaQZvToI0C8Q8XyaNVM3GYgeczbrAygRS4a
         L3PgdrAk/MPOJEZXVwxA1hLob4KWR6ZR6XazoHUoREUGmeNabp8572SxnVy7u0w5dhBS
         Lb5v9ulsvh9QkmCxhgfZhaeOuauTAXnWDBrzVsyttfgmsVxSvns379Ut8EONJYebMSpW
         ca76/pM/kWByLm5ZmhCgZxPeDDufn9zKWuGrGAWy5qO0qw0m7E4CTCjWc2OVGGWxxalf
         YynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x0j3XChK2x67wNf1p9ICYbQQbtwgRuRXvhZomNQ4ZuE=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=jIIb8GuSEUKZ+/Ay5UJ1VBbReO8cYD+j2Fq77X2OYEfjzhVqOPWnlT9kaddww6Lasj
         apernqFhmI2tlCSE3ArxvfrHWtqTb5rKp4PaRESZ/mPaI0UbhH9nT7QsSdVS4Lr2gasL
         +BhhI7fH5EtBTHweDdnUiY5wSLMktMh+LBADQyQOkDoVeAKCokL58LD+ZGcFLgR/jOk/
         S2BwTmRtnuCi6YgY/L8uCYjaaDEst8zMf8hZ0Y7V1Nxaq5RXS048gXMcWdnq0bFyQP+8
         5BYsaHqLaOOfTrRR8Z3SAmykZL0I5AM2o3yjFqKgf/Z/sn/Zqs98LGCbOpMbP89OPeoF
         LOTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804866; x=1795409666; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0j3XChK2x67wNf1p9ICYbQQbtwgRuRXvhZomNQ4ZuE=;
        b=otfCESgE6hS62TDUBepe3eXSowSIq27puKxPIg8h5og7dEoPttD3+yTmfsECa2+CNE
         p2HrcIaKBNuvtb6cV/aohKKCvSlmfKGlb2BzsKJDDAl3FJv+GeG4tHJOzzlrym31SjWx
         YKW7nrIveRw8KnsetiS6ryAB+6Pql3jQ/84TSbqKRlmDrRGn2UdyAKOoDCd13OPIOgLs
         nxL4f0sxE9DkTD/Q0h30ENFjRB6U3h/Q4TZklqUfzJ1wcJ79k11daAEhsbsvO2kBS3x0
         t10162detKqn8fYq5a2jctJZjZgf+FySGDtSKJlmMP8q1JjIE5s9w1XNrN5zyb4qMsQJ
         HsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804866; x=1795409666;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x0j3XChK2x67wNf1p9ICYbQQbtwgRuRXvhZomNQ4ZuE=;
        b=KsDTH66bUyB9EI7oK8aUBxx7eqcIbEkknMjO2WHufW8A+5LhF71dAJz6COuePqqux6
         a2QvaTQDewqFv6QOS4L+oOIdEUxQsM+crUJv3NM5M+FycV68uymMFrrrl233MipVdlwn
         G8un/vYwC7A+sU2jv38I0+rYSgzF4w2TKXI5ctmS0FcK+6CpxTpwr/M04g4nsHBuTdzn
         Kxo18uneL3+vo5HmMO3a5APNk0XcOj6/v5Vbz4T+kdZq/aEXtZESkbwKyw9hBMZmGswP
         bbIf7kaftBSUTlD/kA5hFJ9Q030uNhHhQbUUWbhIPoTr0fOjamoq12YJaoVxhBe+U1dS
         zGxw==
X-Gm-Message-State: APuU4Z87XECdbQUK4kh/v/qBijmc9gxAxSEOQnECMUvco3tN+wpVQRfd
	Kqhinpmp6x5mrJV6G+yD/HChd9U0tyWaNlCVNfcMTxS6fFGBiAWa8oF8GuTQWmCzXCZRAf/1s2j
	0+BHoDGDGdVUmc0okqQiC4If9V5gFr2d1t/Us
X-Gm-Gg: AYBFou3jRaLkOKJVuLquJTxDhx740K3CAJLo56dVi5CxQcKh3Sr7mwux+BshS+LBp/l
	WQOJsFF0PAGGKVpKxXsnyq5m6iwurj9DoZlOOUavPCYEkPTS7/+o+nh/zT/22uKVasD7opQicsT
	Mkuy/v5K5CkNzYeXnSe+UkrxzmAYMyErGwBqdi0Q94tVhfBuA6N1dHXjQpx6/Ifk3rnfJC8+7nu
	jZQ/0prF8t7kroTm/4pO6fgxGzoYe+58LypT1wNjfbpthUpj0EQ9rKVktAZPa0iKv8rjrHiL0Rz
	OagwbXbJU9KejWVfyZLO8pvOaxsKRxGzHVccbtNHxF+M1YgEWx88Sew7hv1HVngLTTF440933RC
	1wAxvudDJ2aTtMvuSsxKuES+5+Ye+b4dTsHGN11AFBF00YCCaJjKsZ7okWIu0LlzGsglV3UAPc9
	ZoV5cZAjz0VqENqAnHrjmBQQj5pRynbvsZjJoxnLSejfNAgyEd
X-Received: by 2002:a17:903:182:b0:2ed:e93:71af with SMTP id
 d9443c01a7336-2ee0dc308c5mr101471725ad.41.1794804865920; Sun, 15 Nov 2026
 20:54:25 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116042633.497423-1-phucduc.bui@gmail.com>
 <20261116042633.497423-3-phucduc.bui@gmail.com> <sashiko-outbox-216193@kernel.org>
In-Reply-To: <sashiko-outbox-216193@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 16 Nov 2026 11:54:14 +0700
X-Gm-Features: AclHuK9Cy-2xJIyp4OLrZQesV79-D3SbAIhTqG24cmDidqGr84da0Aoekbfu43Q
Message-ID: <CAABR9nGkWHy_YEoEa0H+KL3_TGEeco9hnLVvddkw8Y5tNWet2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: atmel-classd: Enable pclk during probe
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> Commit 1dfdbe73ccf9 ("ASoC: atmel-classd: remove codec component") merged
> the codec and CPU DAI callbacks, dropping clk_disable_unprepare(dd->pclk)
> from atmel_classd_cpu_dai_shutdown() while leaving clk_prepare_enable(dd->pclk)
> in atmel_classd_cpu_dai_startup().  Should this include a Fixes tag?
>
>   Fixes: 1dfdbe73ccf9 ("ASoC: atmel-classd: remove codec component")
>
I agree that a Fixes tag would be appropriate here.
However, I'll leave it to the maintainer to decide whether to include it,
as I'd prefer to avoid another revision just for this.
