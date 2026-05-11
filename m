Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901393B9DA5
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495118; cv=pass; b=jom9ghW6Eap14HmPmxhgIAnKdJyjQ4fkaK7A2kQ/W6NSB7PZYWmlDS6XMUWf3pExK6yT2UJKIHttuPxKd1DzrjcVpSOYiEBaFYJ/bILLNS/hNMFWACcFOGegvdbh5fUzUveW+6CMUXueNYYl/4FCYB2G6O6wiS4CGQhwUd+OpeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495118; c=relaxed/simple;
	bh=vH2RJlYCeOfSYlR5bu7uwY8+vlQvHMHRiMHpKSYXzQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0H1cny7jbQ4l4hlObhxkJL5MLOI6wecd25OdhbxlI3gbqYea+Jy435axuk20S+XvoF3fPBN313Nw9+bJVzcl5Y+yszzIfIHZTtwRUPkBMaUcdwOf6EaoplswvsG/Bqzxlsojnsqq862bJCCR9lMoQ463q1fhcDfA88f3G0R0v4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HH4NEwh+; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HH4NEwh+"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-368763a1bdfso371051a91.2
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 03:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778495117; cv=none;
        d=google.com; s=arc-20240605;
        b=DhFDxH6VvVrZ0xgOpMBAUAH76WuBj6DGbT3amfkci+JIKl16yO6aWCVkiq6G1+PQjm
         y2uE6+n/BoPOWHxkzfBfKfaDb3BwDzjhN5u4uHrlrsY2J7Tn+8cgGt0sf34AvmqQUNPW
         G4wFMRkQgLj9IoEdt0yHEt5vjR5LRdhiBYKXVImfsfCidyhFXHP8BPC4uJjOIPCIXIrT
         r5r9bIOsDS8LctSaWovKNsFiQcn8A2lMgp9ahQFK2U5P+s3PuBkmlKCwRS+4Q3cgIK+j
         8xs1Pu2dB0h5HDKXgM2KZtD2ltOGrTgLRS2rg80pP3PyJgxb8rfgVHm92efzP/jfnHwt
         D9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vH2RJlYCeOfSYlR5bu7uwY8+vlQvHMHRiMHpKSYXzQE=;
        fh=Zw9somXhbapfV2OyPTYXK389sSLYKGxMHxE5tCqRMPc=;
        b=EWZOZm1lVbF/3t7ZiwDZY7NlBCN7DeFrI+uNlGqZUX2WA9gKFL1clEL/a5jYzgq3Rn
         wcNvClu8K6i0mJUyACIIMknuXjz1i7krdvelSYaXEG6gAta2RsKT9jbRblOiMaOAwJQg
         ZMDIuUASpiLgaohduBfBqjdIZFKu37AqqmFpFjJxhjeOQs+W339cF8h2foYPEC52KVM8
         HgTIMzJIfU52P/QPDXYe2U66N0+xkIYfIAvJvIGo5HFpmE7vUKKMQO9l4yjqtgzVlUu8
         FdZTt3fQq2PqPVraRb4A6Qg9ouL0iwjseZPcNgm3jQCBxyGnm3wkSD1Ejcyil6Ldk48O
         mH7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778495117; x=1779099917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH2RJlYCeOfSYlR5bu7uwY8+vlQvHMHRiMHpKSYXzQE=;
        b=HH4NEwh+1UCpRaJFe9aySXn8u3SZsRMIKKjbb9ukQVP9nP+V5B2PCU+p+0+Wo6GnGg
         EaSF3hfAkNScQ4cNxXoMu0US6hjeDqLpfGNwxxZf9qUgvzQG4wgepDlkkl6DoV7OGLJr
         DcxzURPZuECKH3mZP0JnlVqIW7CUMbn3qwRTnpuK9XaPLCIh5N1vgLcsnr98NjzAT3Ba
         g8R5KC1eXtqENiyvlkDjcXUdkDXkJbcYLlbDxTAR/wMsDm+TDwfh4D/rUO49q6aWv+g5
         tyhX6oH83OS3xFM+jlvkrWXo7Nl7E8Kqk9fCuAcscfytFSFsZ/NiKzxSdItGXVfO+XQZ
         GWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495117; x=1779099917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vH2RJlYCeOfSYlR5bu7uwY8+vlQvHMHRiMHpKSYXzQE=;
        b=plF5ZYbA5l8g0uV9Qgi2FrSl317u04vYQGl024a3ZDvWctEX986Xs3CtXW6Vgqh93m
         tJXAnd2879BFUjIjbuAmvJyEcJhJq0xvr3RZy05Lkb9e8EB59j6aaINPUpll5xumhUXA
         JZzqNMDzl1DbcZ0AV5UostpT1hwwH1ShWgl05hZjA8pje1njToIn+aAtTdepZ86T1V+M
         nNaucjARaObCCFpVMTl5I+a/mrz4L5G3W/HwJE/X70347GyG71miovL8I9NLwrhhbzEl
         qMOX424i5/HSPxFcsdQTaSecon1yxig+1qCg8ZnTOLansz/xNNz0c0nbZf8sFnJytXRs
         LIiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Q7k0YEbTa7S3MktUXoinwxJTErLc54MEp6NZqiGgF+NSOHF52idsDPSs/N2Npsjjbtn5iYO8AmAmz7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzff3zPmZzz/V6ij9HeDJxmsRM8YkmWrZbsvzZLzPFk+vK6s+BW
	yR0JueoVTm9Klk0nw7R2h5yN/2YSN+e0WIrMzTDpzo97UsUOw5dDEGuwc8+Qe607uDqLBxqKh51
	IWH6EpMiV/Ruj1Gj5hWK0NbxkszvO96w=
X-Gm-Gg: Acq92OGhthTRlGGINOCuNpHpJYQ5wF7uTIfKU3vw3d1cbLS9SlRUzc+I7hZWZc8u0z+
	sxVa3ydFDiJDjLWLR1hioRAY83P2uvB3Sd5O3CCawvqld8KNYe48cGBccjZGhAcQNzOyibvIIWk
	VWPdA9+iszbJ5RD9/dfXAQnQA3WL1dF+1aQvQlcjzntZ2siGG5vF3my1Qcsb1GQqYJgcF0Z6SAm
	FVYCHMwyFYDQ/ATP4a9XWFyY1cexnFcs9v3BKAYJFcDYvPSbdd8f9jmYaoCj+BakMaWB8lieQkf
	DTEDrbOfn/C9oqIMo8DFnLX4JbKQ89ohjR2qJQ==
X-Received: by 2002:a17:90b:33cb:b0:35c:30a8:32a with SMTP id
 98e67ed59e1d1-367d4704ffdmr9410585a91.9.1778495116902; Mon, 11 May 2026
 03:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-2-phucduc.bui@gmail.com> <CAMuHMdVrPChcwzbwrNLZBoRXGQ-Gm4e7UwbOm9gfAzQ-TQzFqw@mail.gmail.com>
In-Reply-To: <CAMuHMdVrPChcwzbwrNLZBoRXGQ-Gm4e7UwbOm9gfAzQ-TQzFqw@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 17:25:05 +0700
X-Gm-Features: AVHnY4LmMwmb8HoXnC7e475rElbDBQl1aVeOa5zbVkNS2rNSLdK45V-U6OAhPp8
Message-ID: <CAABR9nH6QidCNYfTnkMf2_Mhi56WoYau1fgwxDrkqH43jb=_qA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, May 11, 2026 at 2:31=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Please drop this tag: it is intended for giving credit to the person
> who suggested the creation of this (full) patch, and not for crediting
> review comments on a previous version.

Thanks for the feedback. I understand the proper usage of the
Suggested-by tag now and will remove it in the v4 patch set.

Best regards,
Phuc
