Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244058;
	b=Mcf5MPxz6rp0GXQor9l7KpCnW73S9akARtP/DdfkCGYkg50PjiSa07/bFHSRevgLRY0S
	 Ys15GVwIRaNZ/mGPxqiNzUlqo9N5KQZak1SIU9b6CoZE2RFG61NAhVmzECwzm919q74Y7
	 8fLsPlSeloyUyqZ4Ilwz129XG3CD2agYVMySvQYuPNX9IPqfoQRpy+WNAnsT8P6n5zHLh
	 AO2dTJmfIAArzr+Kj/MiWSSCysgXk0WSevJvdAgXIE0LfW0aCanSptNq1Qp5pM86gcbcZ
	 CAxOrOzPqxKJMnUtRuxQMdbikcmfTvRfWLg+hsXAQqzL1Mgt8CriHGDKW7gZzzqP2bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244058;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Htp0kr07ZFrzARTes84N/mltWZmwiM4zIEJ6k4s37Kw=;
	b=vligeIUC6F5j50wzXae7/+lU8/3Scj1L67uyfBQn2IzVOdWT32qvK2YeGJWB7KEMN6GA
	 i+iLkdZZ2lyoxLP0QrqSkml4cPUneL8piPKJJ6vAUrzwXFlNbe37BNdfqy+eOfKqchvW2
	 7697aLRtteQPgngfqGBAFYCfYA2N10LMKzWgqrF/2hJ+B4/ju6LP54HXtEh4tF+QFyaFx
	 JGtSGtW4wedSzNFYhVbF4yvs5GVu/XPJ1OFUhQQP0t0fmlN5zosSV0PJc2aVXPQFkYsXA
	 wB6iyo630X9NsRhVX1nqEqPoP0VuFIKyDSu9/OOMY6bZEgNXIY3qGyUnrvfkFljcFbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcUxmWyQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EFE606A325;
	Mon,  9 Nov 2026 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcUxmWyQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C271F008A2;
	Mon,  9 Nov 2026 17:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794244058;
	bh=Htp0kr07ZFrzARTes84N/mltWZmwiM4zIEJ6k4s37Kw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YcUxmWyQWvOnnBAqN7IoK1HkYtIYTIp0J0urkZEtsp7KcRfHs/ktyXkDpfdbw79O4
	 dS7QlC9keps+3YizUrNa99fb9UDxcOm366k8NUIsHT5P/SmeWzgJ7deQ19ReCCTa9i
	 dSj+2XysrCNBqRzGr+ZCr4Q5oHDrYs2xBi3i6UHbdrG/rJbtabtAjeiiOmKmrUOD+X
	 LMTFa0htaD/lgSygnMPz0HJeQEd/4IZICWTTCJL2sdgoIilj+yC8KKFtAZdWYgckb7
	 1qMHRKkhxW9x2u6xi3oC1LQgVJwzPAdEhWdXiqaAzzdI1k5iQ/mNr4p0Q7IfENGJpY
	 MUDaSk+8wfKzw==
Message-ID: <sashiko-outbox-205275@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: wm8741: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorena Tanase" <tanaselorena3@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109165522.6663-1-tanaselorena3@gmail.com>
References: <20261109165522.6663-1-tanaselorena3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 17:07:37 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] ASoC: dt-bindings: wm8741: diff-mode placed at root level of
  YAML schema
- [Medium] ASoC: dt-bindings: wm8741: invalid example bus addressing and
  trailing spaces
- [Low] ASoC: dt-bindings: wm8741: missing supplies, DAI, and SPI
  properties in schema
- [Low] ASoC: dt-bindings: wm8741: dangling sound/wm* file entry in
  MAINTAINERS
--

commit 9c3870a4814d3bc22a021bf5687bbcb6d6e76c1c
Author: Lorena Tanase <tanaselorena3@gmail.com>

ASoC: dt-bindings: wm8741: Convert to DT schema

This commit converts the Wolfson Microelectronics wm8741 audio codec device
tree binding from plain text to yaml schema format.

> diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml b/Do=
cumentation/devicetree/bindings/sound/wlf,wm8741.yaml
> new file mode 100644
> index 0000000000000..a9a7fc2414bb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
> @@ -0,0 +1,40 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: wlf,wm8741
> +
> +  reg:
> +    maxItems: 1

[Severity: Low]
Should this schema also document the regulator supplies, #sound-dai-cells,
and spi peripheral properties?

Both wm8741_i2c_probe() and wm8741_spi_probe() in sound/soc/codecs/wm8741.c
request the avdd and dvdd supplies via devm_regulator_bulk_get(), and the
device supports both i2c and spi buses:

sound/soc/codecs/wm8741.c:
static const char *wm8741_supply_names[WM8741_NUM_SUPPLIES] =3D {
	"AVDD",
	"DVDD",
};

Because the schema sets additionalProperties: false, device tree nodes for
wlf,wm8741 that specify avdd-supply, dvdd-supply, #sound-dai-cells, or spi
properties such as spi-max-frequency will fail dtbs_check unless those
properties and refs to dai-common.yaml# and
/schemas/spi/spi-peripheral-props.yaml# (with unevaluatedProperties: false)
are included.

> +
> +diff-mode:
> +  description: diferential output mode
> +  $ref: /schemas/types.yaml#/definitions/uint32
> +  enum: [0, 1, 2, 3]
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

[Severity: Medium]
Is diff-mode placed at the root of the document instead of indented under
properties?

At column 0, diff-mode is rejected by dt-doc-validate as an unknown
top-level keyword during make dt_binding_check, and any node using
diff-mode (including the example below) fails validation against
additionalProperties: false.

Compared to wm8741.txt, this entry also drops default: 0 and the
descriptions of the four mode values (0 =3D stereo, 1 =3D mono left,
2 =3D stereo reversed, 3 =3D mono right), and misspells differential as
diferential.

> +
> +examples:
> +  - |
> +    wm8903: codec@1a {
> +      compatible =3D "wlf,wm8741";
> +      reg =3D <0x1a>;
> +
> +      diff-mode =3D <3>;   =20
> +    };

[Severity: Medium]
Should codec@1a in the example be wrapped in an i2c or spi bus node?

Without a parent bus node setting #address-cells =3D <1> and
#size-cells =3D <0>, dt-extract-example uses the default root cell sizes of=
 1
and 1, causing dtc to fail on reg =3D <0x1a> with a reg_format error during
make dt_binding_check.

The diff-mode =3D <3>; line also has four trailing spaces that cause yamlli=
nt
to fail, and the node uses an unused wm8903 label with 2-space indentation
instead of standard 4-space example indentation.

> diff --git a/Documentation/devicetree/bindings/sound/wm8741.txt b/Documen=
tation/devicetree/bindings/sound/wm8741.txt
> deleted file mode 100644
> index b69e196c741c4..0000000000000
> --- a/Documentation/devicetree/bindings/sound/wm8741.txt
> +++ /dev/null

[Severity: Low]
Does removing Documentation/devicetree/bindings/sound/wm8741.txt leave a
dangling file pattern in the maintainers file?

wm8741.txt was the last file matching
Documentation/devicetree/bindings/sound/wm*, while the new yaml file is
already covered by Documentation/devicetree/bindings/sound/wlf,*.yaml, so
get_maintainer.pl --self-test=3Dpatterns will warn unless the sound/wm* ent=
ry
is removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109165522.6663=
-1-tanaselorena3@gmail.com?part=3D1
