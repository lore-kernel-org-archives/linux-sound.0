From: Bryan Scaringe <bscaring@slpmbo.ed.ray.com>
Date: Thu, 23 Mar 2000 16:14:28 +0000
Subject: Re: bladenc and sox
Message-Id: <marc-linux-sound-95382854932533@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95382554828854@msgid-missing>
In-Reply-To: <marc-linux-sound-95382554828854@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Does this, perhaps, have anything to do with the endianness of
the wav?  have you actualy listened to the wav produced by sox,
to verify that this isn't an issue with sox, rather than bladeenc?

Bryan

> From owner-linux-sound-outgoing@vger.rutgers.edu Thu Mar 23 10:32 EST 2000
> To: linux-sound@vger.rutgers.edu
> Subject: bladenc and sox
> X-Face: 	  #0j-Ll[fajrfupWYMv&wa\m7!Sh=&3;JE-_&M-L,ULz(aE8iu%m1SHa5wG.V{3B:Fdnd/T# <P<b~',,9%pqj#J'xeH2{~YMDq$F9i|daAfaCSlo)*ncgkI||wcci_q,RTdM_0y:&w5T4|OH-i{/>O -}0pPGYw%t1z`o&T_c=)p8l<!c+@Ih&mLQq7Q?o:{e'Jch`"Pb%DVQ&o+Pz>[}7R\={[@B*Jyj*.L4 hnJ*AXb
> From: Laura Conrad <lconrad@world.std.com>
> Date: 	23 Mar 2000 10:26:36 -0500
> User-Agent: Gnus/5.0804 (Gnus v5.8.4) XEmacs/21.1 (20 Minutes to Nikko)
> MIME-Version: 1.0
> X-Loop: 	majordomo@vger.rutgers.edu
> X-Orcpt: rfc822;linux-sound-outgoing
> 
> I was hoping that if I used sox to convert a .au file to a .wav file,
> I could then use bladeenc to get an mp3 file.  Instead, I get:
> 
> acme47:(10:23:11):bladeenc greensleeves.wav                              ~/home
> 
> BladeEnc 0.82    (c) Tord Jansson       Homepage: http://www.bladeenc.cjb.net
> =======================================> BladeEnc is free software, distributed under the Lesser General Public License.
> See the file COPYING, BladeEnc's homepage or www.fsf.org for more details.
> 
> ERROR: Sample 'greensleeves.wav' is of an unknown subtype!
> 
> Does anyone know what to do about this?  
> 
> Thanks,
> 
> -- 
> Laura (mailto:lconrad@world.std.com , http://www.world.std.com/~lconrad/ )
> (617) 661-8097	fax: (801) 365-6574 
> 233 Broadway, Cambridge, MA 02139
> 
> 
