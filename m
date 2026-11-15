Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794776684;
	b=UGaX3MNfoYrU19DKbyf+jFwF3bInqwFceuoBRkA7ajOEW8GrBkYytc8bWewoDbHfgBtJ
	 GskzWfpMZovK2rOxuyrYnMT+wVehu22JZUH/wiJQnzVydSBydBHEdXdYKtvbOfotWASKX
	 22r10f6EDr59g0oStSYJJcoT7K+SVm/Wzr6bOJlBaCIV944WcGOtKSg98FSxtXwOrnVy3
	 oOj3TVnVc8TN91+leqZNEJ8jCxcoEtOv1BgSO+QqOi+05q/J4JELUqYyK4ozR3CfJCK8x
	 keB2aUMhcCIM6Xbx5P4ke6A5OlSus/YOMsVr2dfhpPPmduGrwh/M4Jv4SEWG+9p0fow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
	b=RyzR2l/Fwi7wSOf2AQCAip6JxMFcMb+Y6iueA8EbWF6MUqewGocpgoSj04ta0sI0pvFe
	 IMi/qqW7TkszgaEOPOLu/YSnX7GrIkS8TsIkBVIbNqCbbMNDkrSs4yEmhyNCYDW0vpkPI
	 BCTxDXQjjlokSWwTNSsWE0YAoGoexT06S4RwFcExxEyhmsOCabj++ppO84XAcCQC8wOj3
	 yTkaowkigbcgfjlSYpTXbheNhNTQaU9jFA8ZpJmK6pfmx3UBrCDw7wfQW1RQrOad2ZCvz
	 VgNb7PrlhtzWQf0zkW38RlPPzRJHfRr9IfQ2jlqTSXLfrbc3iuIcVmaN34wY4Y33ytQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aXPCVwfx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE1606A329
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75CE1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aXPCVwfx
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67db5e13b0cso304947d50.3
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:04:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776683; cv=none;
        d=google.com; s=arc-20260327;
        b=ESr49jGyB0odFGTX4ZEL94vleUBQbRE+TcMGnbIwWZZaherTmYKU3B89nqnLLIsyKr
         MGdzG0bjf6GJiQWOe2iFIHsOjthBUizxPue0cTGVAUi2D5CJgKtY0W00UP+GndFudOz6
         Nx4RoSR0MalWGle1BuHh0GYZUDf/FJF+Mj/V1T+5wfO8iQdvZ201PT7RUc3SwyClGzWH
         SkX6b1mZRfejASv94qEKwXCGq2j8lQ0z46f1qE7P0xZPWFAbOszA1ndkHCpQVTxwABeG
         2dXeK2R0RDGWu16H6dN/5Fz/pP6nDkICG15IOfVDXWAPdAIX9gejBNQqRe0OZEZQMUKf
         jKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        fh=fJOtHgHJvrar+XUQ7N7k+DUU424BpwaN5abEoFJjGME=;
        b=LymSHxk+GDhoz5zIfshqRxgcb191gqB8u14bLtLQHmF2ji8o1q+m8Unk+WctidFhGt
         J5gyx9Lknagmy+8f3ttqjl0UNEuc3FZXIPZodfjdk4m7tYVKYiBUG0LL1W7noZnVb+T+
         PiqKwgnempDcES5Slt1fY2ta1oDNDem7U1Kto0XIzTd0AogR0sHcHtHt+gh9bHAW2/B3
         PKihnAuxM248vqqNUhLs9GJQLqttZ596swGLvipOYangvGIYyaYxsy0B+5FyBtQS4Oqy
         w77ZwS3y0VF362dcrfaFq/9erS7xTqVZ6cHvHM3/wqz+/VxG5MMQ+LFjX+WgmkK9Z6Wr
         G3iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776683; x=1795381483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        b=aXPCVwfxL+U9CzSjw15PUia7M/Maex05durHtcijeoqRj39L0XOsvUxgOm5jygXmf7
         dsUly9B5FSkWRJW/0AfffHZktcq5Tn1k2yDWad476fvMt7Q8QS3KrB6uTQd1Y7EwsQIU
         8Tjnk7ldXmlXusoxA1JB7NM/0ejeOtNIePsRXX0ydmMQ/kisjfO8TOVCUEO+1c7D4hi+
         7ExJ+ufyjAyv23ItPvSej33CXAfl0Zr/tbvjXXFLurtBDW7auR4pziSiUURj5fBn/hp6
         +m+lAHg9M/T1nj7/UGpSyVeGFF8KK7OClKihchyjewwnJQNGcbQguSy/O0ABI/jb8QP0
         EMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776683; x=1795381483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        b=Gx7WsH8iguAfYhG4NY49jL1VphRawqFQMD4fcwOjM5yDvlbOuvyhGzHonaEPVEy8cT
         C69ppKGJX809xTcl9aGclNSfAkrTqO3WeIUoMD+NYPPDVmd1n+d9ilPS1n+hhT9q6Rm0
         PNIZCT2MWgWFj/tlEX/bg3qKtPF5NKxS4LB1vNEzKd4aT4gyTlEwWvM4ams11m2tPCAF
         nR0LRh5NWajbA9Ym7beNjBoLvc+R5f/0YY3qZwr0E24RhJruqNGcLOYpTFVU0oLfR9sD
         yzMRlHn/BzOKpF48yePXx25Eb9lTeSS4j71U96n19JI0a/GlINZpwSRPpzoLgGlcTFyW
         byfw==
X-Forwarded-Encrypted: i=1; AL+hErFfvg+ShcmfKSezaGYVCa5jiGZGrmLs/RZbN6eiUfauRXFEoqmygoc+M9X6Dyq/bqmZ0oS4pG3feCLJBw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/IeUmeNi5p0BXSpNTQtoaDIYhQERKIgJBE8pym6QpMU6ZFayLt
	WE/Hag+kIvyeb3S1/93nxh3AIODUil48GwwTTDCOlXPBDxoUFqXXI2MG90ge0mzBLBNUPGYG4SB
	4LftEHxBz3caPXHk8sIyY7N4H1+bt0G4=
X-Gm-Gg: AYBFou1JjtoBZ1v6nSJQmJWxcHrKhsxi6JN7MR76I3Bz+LhG/I6MVgBSNxvZ3H6Kw1J
	MEXbAGAEbKOC7BgBeWlUPSEisOowyczZbywG6pH94Ti5Wf9s3tIzLgWTQxh7W5oo4t7AUEbyDLS
	X74VL4xgi3WBhk0/QHryc+envv9Pn3KrKq4BBR7bhJDSqKtnyUDiWA6hB35bxsLJ7vOrlKuTAJQ
	+4jQm5LtCeUS4omj8g59bOEtiI+a020TXdbvKIJlPggnmMcmypFVtG6SDjOcqmN+C0NT5Dc6J6X
	tbj/lxD4Howp5AFjB8IvV6y7hd9e+Zda5XUq0j0xG0bvw5ubRCMDGgl43zn5BrPJprvvhyUNGpO
	IbykqUlwhmk/1poql1JjtGIBrlyOT4RXU9H9wBfAresKoyziNKG6YYx3jV/kWszJgFhW8UA==
X-Received: by 2002:a05:690e:479f:20b0:67c:2b34:31a5 with SMTP id
 956f58d0204a3-67d896aa73dmr2886678d50.56.1794776683083; Sun, 15 Nov 2026
 13:04:43 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-2-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-2-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:04:32 +0100
X-Gm-Features: AclHuK9HsBcphbKQs0k8LqAA9uRq4kzQTQJzZ3MTf8At638gba0WRnCC9ExoQzo
Message-ID: <CAFBinCDtqNQM=89mQ9uw7hr1CJVGo5fHNPJd=jAyDZ3+L3wCvQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] ASoC: meson: build gx-formatter as a separate module
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Instead of including it in 'snd-soc-meson-aiu', create a separate module
> for it. This way it can be independently selected by either AIU or the
> (upcoming) AUDIN.
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
