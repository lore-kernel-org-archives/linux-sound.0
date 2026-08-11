Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A99C3905E3
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 02:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786415317; cv=pass; b=HflTBdRaWo/j0wJ9hD8wJzvOEq3f2SE/1Bkaepuw/6Ta4ulDA16uHS08DW3TbiIKgdeb2YqLABIMzFcS+bv8LiEiWbNtoXqfl8uvZ5rwSLP2RWZap408WTUfshSbZTfoatCW6bb20Bnnnb9giOMYQdRUT40eQW2vnQN6+LwwNqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786415317; c=relaxed/simple;
	bh=AUc+FEsu+DrlUEKF4zIc/Pac63ML9yu4ibWXeDmIe8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJnjB7fGqTX7MdJP1PLoOBclcjeEh/irnUcr4a+u5AR+jbNNgqjVhj7OEXyH2oCysL8qEiZx3PpgofsGBr1xSFYnwTbQv3I2HHbD62xkVazIId+jUkxMQGZ5ohNt+LvHxRWezyLys2y3WSwaF4NK9eH14pBels8PQ4dyIwOZqW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnmmKpHo; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnmmKpHo"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c998fd549a8so1920705a12.2
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 19:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786415315; cv=none;
        d=google.com; s=arc-20260327;
        b=AZW+rCYGy52rF6Ti3lo5dvye+C1ggd4ytFFSKGIPhAeKcRXIPNGVaKbvkJ1bpGbD9+
         b9QuW4dviU9J4LmImMDreCpHz4/WAR87d0W2fWkuxBZkLjtNSWeR4z3JV5QsljzyOFEA
         2jfCbOYt6xUlYiRZzTFxNM7GQRD+2PF81g3i71jnpEUMAc9HViPnD6oTdOLAJcX5Zzbl
         MrETAdQo/OY93Kq9jOXQJDmNqWqeTihZNiZZ6CyVkBdqOq2RX2xa3+6Otd9xBMnhBlUH
         qvwQqnFu10T5rHx1atTIiSBYlNKhO7xLWt8jVK4m1GOH4fKLc9VcfUwD79SqOwU8RGHQ
         dypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=;
        fh=xJ2XlhtXAgXXcFGrxLKSc+YqKRWA+J16M28G43xaaO8=;
        b=icnR7PGb3U2OALJAl1Blcs9SecXkLdqQyu+qcpPo0BkKQfhkTBWG71IGstgNx8W+Hp
         TiD1+Tc4ZAZN+LpP7QDb2COnbjPKSLhpuoK2OoGQqauUWc2zjqZhu0tOewV0gwFjLYeN
         VkbScAIoFixRawNOni8ZwSXLOYN/Kiy0G+ux5nNQR2zgElnW74L+Cng+byFMx9Vs7Q1/
         L7C1/xpAaMuEeM3/BMUMzdfl+JPcchhS3UV9qGjGWrbd2EJG9jPXGDtPijVHODCnSQG+
         JBt2jCY7aZkHzy3LfN8XBRrTgEWOaBmXOphgXOVH6f7SuQvjgQmgEGbQAEkMnk9e/DuB
         9o2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786415315; x=1787020115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=;
        b=LnmmKpHoc31KzFeLH7aU/s2Vwlfaxsm27onqqErO8ZYT6QaVm5xOvNTbBLX4YgAUBK
         oXtE+3NcAzGJ7HtMxMgUx68xRUgTn7ai0TU7FkLdwhkJLrRUH77S4kfjHHIlVPiIZe6E
         xpTXJ5yPc0sc1xV70ojdbBL2d3eRVdsLzBMktVhr87fdRddhwnkApGjI9MCc80nGPkI0
         w4+L6Ckc3CrlD5/kkVC+bnBfGVrYE+/eOiDRQX5RQhMluKHZE3ef2J82a1dOrqN4v6lj
         Lk9/lV59iId/E0iRfNic0lqXQsvBreC/KGQh/qc9FFbQRPLxfC7G9yAOSg9svNUvLajD
         FvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415315; x=1787020115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=;
        b=Ahzrt9mZd9TX0LDXFG+ePVrmvkzPd8zbR7mPOpNPaVFhyqHfPlII4Uvezl4mz4FO4u
         hhrSBkZB0sBwbrX77J11arEP2wP6DhS936ydOsea4tFYon4vYiTX/YQZ7cJV3NEs/PxG
         0cNovzjWYjEtXwtgsSEJZtreoGZf1tntIyN50GHuTWQLw2pXc9g3akns9dp5xUtchWnH
         YXqwYDXhVJYYlYBvV0r3s2pucdWYWx3SiUQwTLgnsUl5bOsR2MrofluR1LVAKCqOVsCu
         PCxhnG3B6NiCSYtNcLrg13bKTQLW7hGqR3Al/kr1v/UXcIylePFySxyeMydhOb1uqI8r
         rWuw==
X-Forwarded-Encrypted: i=1; AHgh+RrOxtLVs7X/Yk6jOpSXyHD6/3AE8HyNanLMGYgq4du4ff4c8ykfF4JP+CKuXJ4dxT0MTaVqTHaLTe6JrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywesj2bM7qzPqaN6IH2/7VXwc2gf5e+pIezoPhC2JO4V1F3Z0Fw
	ln6N8uuqVtOXx3+M7BMxtI/RKpH8Ku58e+2xH+bUvWCmcUbum2QRlURDyAweEpL+RfHfhPYYRiH
	K5vmS9JogYjiZrvqZ5eSAQjMDrVPhdKg=
X-Gm-Gg: AR+sD12oDo2ucibXMFXr6k0HX8Fy8Xwo+eev8NZcLpJQDDYEryZlGeRaYVdO6/cwLKA
	Z0MvETHmVOB9jZgH3lfyNp9N65GJBektaEia5DPfOrPJ4nyD6PBOy1qErSuJnHRTAtXYHboFc/e
	EPQG5ct2Tk0syzKESjdoWqClNvmZhlZZTHF+TpB31LbTCcedWdw1iI9Jk3oFNR1fredhFjcPVEL
	olXuUpHhmwudqcZsXbeTHMoFB/A1rmmU0ZSAdXtBRXfBzAmuvUr7e+OF9B6ShBi5Jz1kp89NjHz
	eYQihEftdJ5XBoG/60RuFlgbgxUxh3QeGupMie+dl1I6
X-Received: by 2002:a05:6a21:e0a6:b0:398:837a:7af0 with SMTP id
 adf61e73a8af0-3cc2baff1a5mr397245637.30.1786415314854; Mon, 10 Aug 2026
 19:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <20260810-normal-cuscus-of-argument-4b230b@quoll>
In-Reply-To: <20260810-normal-cuscus-of-argument-4b230b@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Aug 2026 10:28:13 +0800
X-Gm-Features: AUfX_myaxBa_rPqdovqcCYr4z7pz2bgmNVRQ7bdnJSbreWmsZ5qeF4VRopEa4z0
Message-ID: <CAA+D8AM9s7EX-G246Hf2=DOx5q2qXWg_MjUCaoJ8RggOjp+5cQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 3:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
>
> Which SoC? Did you read this binding you are changing?

The i.MX35 ASRC (the original) already supports three conversion pairs
(A, B, C).
All subsequent SoCs that reuse this IP -- including i.MX53, i.MX8QM, i.MX8Q=
XP,
i.MX952, share the same three-pair hardware. This binding covers all of the=
m.

>
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
> >
> > Add a ports container that enumerates up to three sub-ports, each
> > representing an independent conversion path:
> >   port@0 -- conversion path 0
> >   port@1 -- conversion path 1
> >   port@2 -- conversion path 2
> >
> > Each sub-port references audio-graph-port.yaml as before. Hardware pair=
s
> > are allocated dynamically at stream open time; each active stream
> > direction (playback or capture) on a port consumes one hardware pair.
> >
> > For backwards compatibility, keep the old single port property but mark
>
> Why? Did the old hardware change that it has more ports/paths?

The hardware has always supported three pairs; the original binding simply
did not expose them all. This patch corrects the binding to match what the
hardware has always been capable of.

>
> > it deprecated. A schema constraint (not: required: [port, ports]) ensur=
es
> > that both forms cannot be used at the same time. The binding example is
> > updated to show the preferred ports form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
>
> Does it break other users of this binding?

No. The existing single 'port' property is kept and marked deprecated
so that any out-of-tree device tree still works without modification.
The new 'ports' form is additive only.

>
> Why mentioning upstream in the first place? Either this change breaks
> ABI or not, explain that.

The deprecated 'port' property is retained, so this change is fully backwar=
ds
compatible and does not break ABI.

Best regards
Shengjiu Wang
