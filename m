Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479094CF481
	for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225931; cv=pass; b=Arz1u0A+ZUh7geiGYmYrhRUbNsgGnkpy7AeLEILw5YR5WJVtRq5wvsC1YMbHbmERmZjPzg3yVarZB/NhMBhN6X77d0OaswI/X2EUKxtCRk12GU4LjAKR56h+uWjpUhRZUF7pCqxdoIZlO6s9TAC3F4Ftp0AawKSAAKsbhMxPTRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225931; c=relaxed/simple;
	bh=BSPQ+6lrEwCu09nKbFgXJDtvyeOV98p5qJJX4t256Pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzqBsEdYn3wihi6m0jdOeFndsWhroXsgQXxGoIMx8SDIIiQO//TlhHBh67pZFirZEYdgWDK4K0qq1CgXTgwsQeqnsWjAEGxLeehdpmYEULFI6o2BrGC/LsbKeairKWKU7SFpjdUbWPjOm91f4whV6fbYO45pEYOzJUsXJCvdcUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtkTYQYT; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtkTYQYT"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67989a98f8bso422777d50.2
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 01:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792225929; cv=none;
        d=google.com; s=arc-20260327;
        b=OgRisktrq1BJZIK7Xn9fSIw4kdDs9N+//Zao3K1YplIimMyM7gFlALrY+mShmu8pRZ
         lefRtYgSy6JF+ol6+3IShyPkNAlP8RdPKEMkwAfgAs1zY3ZQvXOOm0MwFav9aRvagx06
         gWoIn0c+BsrK2XRw2fvQvJh07KXU8sRCFDjHxiuaJsct6c1jgOt4UDMgK+IG0RxfHHCs
         vPByUrk5nW1rf8/+Bg8FZl81QTutp/+VxnK5CV+fUa7oXkUnKLH4guyu5G/pvTeXZz5w
         PrWkM/Fx6stAux6zRXvfpvaRaZ8dfkIPCFAHT9gnIBmPP0nB+aw8A+TZI3avGuyj2UB0
         Ftog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ouYdj6Wo8QUkLazyyYloYrZvy3tpdZIKXe5cmoTFy/8=;
        fh=F8XiwePd/UqXpEaUVRGaz0slsGO1U53mbZwd6GGXaaw=;
        b=qZl45XzDLxZFam827MIoiODiidYtakJ30b9ZWtD+Le2Cp6Ze7IBI7+xbcj5C2TXr08
         9lhurL+PjpnlvAW0hAffuCmxeg9KAPaJcr2jK69IdX48eLnVNdj86t0oIB2dDvLWQOYh
         hb4MyXfD7dX7TO6a3EFIUfe4BXV/LZeDc0JNBiT7QSdhaeUJ6c4Bl3Wy0jp3iknzNABR
         Kg5vAjx8ee/cvYD2hdRMIi4UzfX6En26yj4NOIBUvS8bLI4eRldHKEq/4BVylHc3G1y4
         E5oPcXy4y4rfQXQDDFM0BdupUxVY/1aykjdwdDBNPtrx8w68/+PQpQWd8Jk7znJOYHtQ
         KPEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792225929; x=1792830729; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouYdj6Wo8QUkLazyyYloYrZvy3tpdZIKXe5cmoTFy/8=;
        b=AtkTYQYT7965BZSOWzJlkJc4krP3Sf6NouZ+RFHDGM4zTp4g8xBuFfAiNmWNKW3laJ
         I9lvMUCEBjyt/oAdGa8mhoe2dHPP/IBK5TB5KXRKC7rn9nKYxAGaWwJVQIUUqezS53Y+
         NJTx89xzGQr4XdfMN0BDcr2OyUOUNiRMwGXU90ue/sFAcXZcj/UBGCaYv4v3mGM/YfSA
         pBuBHthza+vdWXzOSXAsCY0OGdt7lKWSZ1L6y5GmGcGmV/bnqT9qIyB/mYgtRnc1+RsY
         U/9rIrM00FtZzuTVbz5hDtuWgJ5gD1BfWSa60eQcHnA3YY/g4MnQJEEaArlw89/mTr/r
         YaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792225929; x=1792830729;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ouYdj6Wo8QUkLazyyYloYrZvy3tpdZIKXe5cmoTFy/8=;
        b=Mvp9xAM92926dxRQsXr4ehlwu5+nu+Th0LolpetMM3XL2nSuwBrXQqP6YQ+tQRzuz4
         AZwvY8ud62KfikcvEd3CmHBorACyGXNLuJoX+6ScwngDdeNaNBe5fcpPtWqwA4H3BG6e
         MsSgOPlaFe6nv7qyIGYr/PhyUcwJMEbjWY91A2PFnGsmpkuD30ose0/QCd5+VXs8zURf
         7wR+2Vyd2BnJ2Ic/h9qQGRYPAWKPeH6C8PWY2yuGl6oMu9rDbrrRPyzV54Wei4tlrlTV
         AMhV9fgBIVM6lbfM6DZYPGIQ4ZSWnUxGu0tqPAWfXaYB2F7gFiUnL5h0fVVpZH7594yS
         S5vA==
X-Forwarded-Encrypted: i=1; AKwUvBwxFaa7scQFrLDLm7nCARMQYzxK+GsyQ4gp8WqoudhFJ16sflZZx6zrhJ8tw/Ud1kZam976tJEa/gRslA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI9r4Jlu3BklFFmuD4VF3VQhr0UUlAs4kaOovo5NavC7dit95Y8
	pudBiHKqQaSvcOsl3Y30OSDHKxCjBGeR6qK3VwrVVENhULy82szk0TYoxtuRtZ/Ynjg2aE3IISo
	kmii2/Wy8rY9TMyxwt8YX+3xdu9Wl3aQ=
X-Gm-Gg: AYBFou2x5oi7OtrZkX4K3ndHnh+LcTwW9KLmQ3ALm2zgcIe3Qnlj/Igpyy3P0bWVimh
	7nfW5WdvOYDIFG2FJw2KoQlcO8bVvR7csIgUtJxX/LCGvAk3EYoKAXOhYzkbzEkP6aYDroP35ch
	MEIQLrQsrOZ6JBbvudM0dbIrvj0kcO1YQJl8zLQ6CAwDCH0vuLq9FK5GhRDG18ULUttsX2YfzpU
	tfDhHJMl3U+DS54xW2SXm0BgVe79RUip8lbFERwUe0mS0Xz9kE3b/CVii1iqcsmTAsVax12XM5I
	BPUmEyhVPOoHHKcaObmUziioYwO7UwgbRAgPmWmlrHQTYEB215uCnumlvh/9GojxNkSVtbqDUeU
	cH/2gALEmCw==
X-Received: by 2002:a05:690e:4806:b0:677:d126:c54 with SMTP id
 956f58d0204a3-679ca80ab51mr426527d50.68.1792225929061; Sat, 17 Oct 2026
 01:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-1295c9b521e15b3753d6-v2-d2f1fcf0f038e0776f7c@gmail.com> <87pkx8211i.wl-tiwai@suse.de>
In-Reply-To: <87pkx8211i.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sat, 17 Oct 2026 16:31:58 +0800
X-Gm-Features: AclHuK9HIqmHOPc3Q_ji2t1xTNmKdcQ1VxP_QGZt45VsIjkNcySDX8f1f-QueX0
Message-ID: <CAFRLqsVgOKjM=r7PvkuV6qy9H8FZxSq8Rc6mVAP0w12LhgymPA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: seq: oss: Initialize the timer before publishing
 the port
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> This issue should have been covered by my recent fix:
>   https://patch.msgid.link/20261016161930.482309-1-tiwai@suse.de
>
>
> thanks,
>
> Takashi

Thanks for the pointer. It did fix this issue.

Best regards,
Cen Zhang
